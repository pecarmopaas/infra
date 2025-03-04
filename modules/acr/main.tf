resource "azurerm_container_registry" "acr" {
  name                = "acr${var.naming_location}${var.environment}${var.app_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
}

resource "azurerm_role_assignment" "acr_role_assignment" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "Container Registry Contributor and Data Access Configuration Administrator"
  principal_id         = var.principal_id
}
