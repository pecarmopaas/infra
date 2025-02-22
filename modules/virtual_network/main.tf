resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.naming_location}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}
