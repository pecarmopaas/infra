output "vm_id" {
  value = azurerm_virtual_machine.vm.id
}

output "vm_name" {
  value = azurerm_virtual_machine.vm.name
}

output "pip_id" {
    value = azurerm_public_ip.pip.id
}

output "nic_id" {
    value = azurerm_network_interface.nic.id
}

output "nic_name" {
    value = azurerm_network_interface.nic.name
}