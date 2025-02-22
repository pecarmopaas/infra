resource "azurerm_resource_group" "rg" {
    name     = "rg-${var.naming_location}-${var.environment}"
    location = var.location
}