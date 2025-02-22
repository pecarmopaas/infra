resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${var.naming_location}-${var.environment}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
}
