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

  lifecycle {
    ignore_changes = [default_node_pool[0].upgrade_settings]
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

# data "azurerm_virtual_network" "aks_vnet" {
#   name                = "MC_${azurerm_kubernetes_cluster.aks.resource_group_name}_${azurerm_kubernetes_cluster.aks.name}_${azurerm_kubernetes_cluster.aks.location}"
#   resource_group_name = azurerm_kubernetes_cluster.aks.node_resource_group
# }

# resource "azurerm_subnet" "ingress_appgw_subnet" {
#   name                 = "ingress-appgw-subnet"
#   resource_group_name  = data.azurerm_virtual_network.aks_vnet.resource_group_name
#   virtual_network_name = data.azurerm_virtual_network.aks_vnet.name
#   address_prefixes     = ["10.240.2.0/24"]
# }
#
# resource "azurerm_public_ip" "appgw_public_ip" {
#   name                = "appgw-public-ip"
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   allocation_method   = "Static"
# }
#
# resource "azurerm_application_gateway" "ingress_appgw" {
#   name                = "ingress-appgw"
#   resource_group_name = var.resource_group_name
#   location            = var.location
#
#   sku {
#     name     = "Standard_v2"
#     tier     = "Standard_v2"
#     capacity = 2
#   }
#
#   gateway_ip_configuration {
#     name      = "appgw-ipconfig"
#     subnet_id = azurerm_subnet.ingress_appgw_subnet.id
#   }
#
#   frontend_port {
#     name = "frontend-port"
#     port = 80
#   }
#
#   frontend_ip_configuration {
#     name                 = "frontend-ip"
#     public_ip_address_id = azurerm_public_ip.appgw_public_ip.id
#   }
#
#   request_routing_rule {
#     name                       = "ingress-rule"
#     rule_type                  = "Basic"
#     http_listener_name         = "listener"
#     backend_address_pool_name  = "pool"
#     backend_http_settings_name = "http-settings"
#   }
#
#   http_listener {
#     name                           = "listener"
#     frontend_ip_configuration_name = "frontend-ip"
#     frontend_port_name             = "frontend-port"
#     protocol                       = "Http"
#   }
#
#   backend_address_pool {
#     name = "pool"
#   }
#
#   backend_http_settings {
#     name                  = "http-settings"
#     cookie_based_affinity = "Disabled"
#     port                  = 80
#     protocol              = "Http"
#     request_timeout       = 20
#     probe_name            = "probe"
#   }
# }
