output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}
#
# output "appgw_ip" {
#   value = data.azurerm_public_ip.appgw_ip.ip_address
# }
