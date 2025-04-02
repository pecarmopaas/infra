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

module "acr" {
  source              = "../../modules/acr"
  resource_group_name = module.rg.name
  environment         = var.environment
  location            = var.location
  naming_location     = var.naming_location
  app_name            = var.general_resources_app_name
  principal_id        = var.aks_principal_id
}

module "aks" {
  source              = "../../modules/aks"
  resource_group_name = module.rg.name
  resource_group_id   = module.rg.id
  location            = var.location
  naming_location     = var.naming_location
  environment         = var.environment
  node_count          = var.node_count
  vm_size             = var.vm_size
  os_disk_size_gb     = var.os_disk_size_gb
  kubernetes_version  = var.kubernetes_version
  aks_principal_id    = var.aks_principal_id
}

module "aks_appgwy_dns_record" {
  source             = "../../modules/dns_record"
  cloudflare_zone_id = var.cloudflare_zone_id
  dns_record_name    = var.dns_record_name
  dns_record_content = module.aks.appgw_ip
  dns_record_proxied = var.dns_record_proxied
  dns_record_type    = var.dns_record_type
  dns_record_ttl     = var.dns_record_ttl
}
