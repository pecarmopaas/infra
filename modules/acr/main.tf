resource "azurerm_container_registry" "acr" {
  name                = "acr${var.naming_location}${var.environment}${var.app_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
}
