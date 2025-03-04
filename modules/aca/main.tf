resource "azurerm_container_app" "aca" {
  name                = "aca-${var.naming_location}-${var.environment}-${var.app_name}"
  resource_group_name = var.resource_group_name

  revision_mode                = var.revision_mode
  container_app_environment_id = var.container_app_environment_id
  template {
    container {
      name   = var.app_name
      image  = "acr${var.naming_location}${var.environment}all.azurecr.io/${var.app_name}:${var.environment}"
      cpu    = var.cpu
      memory = var.memory
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }

  registry {
    server   = "acr${var.naming_location}${var.environment}all.azurecr.io"
    identity = var.identity_id
  }

  ingress {
    allow_insecure_connections = var.allow_insecure_connections
    external_enabled           = var.external_enabled
    transport                  = var.transport
    traffic_weight {
      latest_revision = var.latest_revision
      percentage      = var.percentage
    }
    target_port = var.target_port
  }
}
