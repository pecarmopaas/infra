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

  identity {
    type = "SystemAssigned"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  lifecycle {
    ignore_changes = [default_node_pool[0].upgrade_settings]
  }

  ingress_application_gateway {
    subnet_cidr  = "10.225.0.0/24"
    gateway_name = "appgw-aks-${var.naming_location}-${var.environment}"
  }
}

resource "azurerm_role_assignment" "aks_user" {
  scope                = azurerm_kubernetes_cluster.aks.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = var.aks_principal_id
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = var.resource_group_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

resource "azurerm_role_assignment" "aks_acr_reader" {
  scope                = var.resource_group_id
  role_definition_name = "Reader"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

data "azurerm_public_ip" "appgw_ip" {
  name                = "appgw-aks-${var.naming_location}-${var.environment}-appgwpip"
  resource_group_name = "MC_rg-neu-dev_aks-neu-dev_northeurope"
  depends_on          = [azurerm_kubernetes_cluster.aks]
}
