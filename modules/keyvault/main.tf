data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                = "kv-${var.naming_location}-${var.environment}-${var.app_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
}

