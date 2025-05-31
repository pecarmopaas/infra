output "id" {
  value = azurerm_container_app_environment.aca_environment.id
}

output "identity_id" {
  value = azurerm_user_assigned_identity.identity.id
}
