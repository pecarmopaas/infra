resource "azurerm_log_analytics_workspace" "law" {
  name                = "law${var.naming_location}${var.environment}${var.general_resources_app_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "PerGB2018"
}

resource "azurerm_container_app_environment" "aca_environment" {
  name                       = "cae-${var.naming_location}-${var.environment}-${var.general_resources_app_name}"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  logs_destination           = "log-analytics"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
}

resource "azurerm_user_assigned_identity" "identity" {
  name                = "ua-${var.naming_location}-${var.environment}-${var.app_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
}
