resource "azurerm_virtual_machine" "vm" {
  name                             = "vm-${var.naming_location}-${var.app_name}"
  location                         = var.location
  resource_group_name              = var.resource_group_name
  network_interface_ids            = [azurerm_network_interface.nic.id]
  vm_size                          = var.vm_size
  delete_os_disk_on_termination    = var.delete_os_disk_on_termination
  delete_data_disks_on_termination = var.delete_data_disks_on_termination

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
  storage_os_disk {
    name              = "osdisk-${var.naming_location}-${var.app_name}"
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }
  os_profile {
    computer_name  = var.hostname
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}

resource "azurerm_public_ip" "pip" {
  name                = "pip-${var.naming_location}-${var.app_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.pip_allocation_method
}

resource "azurerm_network_interface" "nic" {
  name                = "nic-${var.naming_location}-${var.app_name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig-${var.naming_location}-${var.app_name}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_id
  }
}
