resource "azurerm_resource_group" "rg" {
    name     = "rg-${var.naming_location}-${var.app_name}"
    location = var.location
}