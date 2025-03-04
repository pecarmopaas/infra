environment     = "dev"
location        = "northeurope"
naming_location = "neu"

vnet_address_space            = ["10.0.0.0/23"]
general_subnet_address_prefix = ["10.0.0.0/24"]

aks_principal_id           = "17f48f82-8f16-4a51-a989-70997a758c53"
users_service_app_name     = "users-service"
users_service_cpu          = 0.25
users_service_memory       = "0.5Gi"
revision_mode              = "Single"
allow_insecure_connections = false
external_enabled           = true
transport                  = "auto"
latest_revision            = true
percentage                 = 100
target_port                = 8000

