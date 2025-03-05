module "rg" {
  source          = "../../modules/resource_group"
  location        = var.location
  naming_location = var.naming_location
  environment     = var.environment
}

module "vnet" {
  source              = "../../modules/virtual_network"
  location            = var.location
  naming_location     = var.naming_location
  resource_group_name = module.rg.name
  address_space       = var.vnet_address_space
  environment         = var.environment
}

module "subnet" {
  source                  = "../../modules/subnet"
  naming_location         = var.naming_location
  resource_group_name     = module.rg.name
  virtual_network_name    = module.vnet.name
  environment             = var.environment
  subnet_address_prefixes = var.general_subnet_address_prefix
}

module "keyvault" {
  source              = "../../modules/keyvault"
  resource_group_name = module.rg.name
  environment         = var.environment
  location            = var.location
  naming_location     = var.naming_location
  app_name            = var.general_resources_app_name
}

# module "acr" {
#   source              = "../../modules/acr"
#   resource_group_name = module.rg.name
#   resource_group_id   = module.rg.id
#   environment         = var.environment
#   location            = var.location
#   naming_location     = var.naming_location
#   app_name            = var.general_resources_app_name
#   principal_id        = var.aks_principal_id
# }
#
# module "ace" {
#   source                     = "../../modules/ace"
#   resource_group_name        = module.rg.name
#   location                   = var.location
#   environment                = var.environment
#   naming_location            = var.naming_location
#   app_name                   = var.general_resources_app_name
#   acr_id                     = module.acr.id
#   general_resources_app_name = var.general_resources_app_name
# }
#
# module "users-service-aca" {
#   source                       = "../../modules/aca"
#   resource_group_name          = module.rg.name
#   location                     = var.location
#   environment                  = var.environment
#   revision_mode                = var.revision_mode
#   naming_location              = var.naming_location
#   app_name                     = var.users_service_app_name
#   cpu                          = var.users_service_cpu
#   memory                       = var.users_service_memory
#   acr_id                       = module.acr.id
#   container_app_environment_id = module.ace.id
#   allow_insecure_connections   = var.allow_insecure_connections
#   external_enabled             = var.external_enabled
#   transport                    = var.transport
#   latest_revision              = var.latest_revision
#   percentage                   = var.percentage
#   target_port                  = var.target_port
#   identity_id                  = module.ace.identity_id
# }
