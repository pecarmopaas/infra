resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.naming_location}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-${var.naming_location}-${var.environment}"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = var.os_disk_size_gb
  }

  network_profile {
    network_plugin = "azure"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
}
