module "rg" {
  source          = "../../modules/resource_group"
  app_name        = var.environment
  location        = var.location
  naming_location = var.naming_location
}

module "vnet" {
  source              = "../../modules/virtual_network"
  location            = var.location
  naming_location     = var.naming_location
  resource_group_name = module.rg.name
  address_space       = ["10.0.2.0/23"]
  environment         = var.environment
}

module "subnet" {
  source                  = "../../modules/subnet"
  naming_location         = var.naming_location
  resource_group_name     = module.rg.name
  virtual_network_name    = module.vnet.name
  environment             = var.environment
  subnet_address_prefixes = ["10.0.2.0/24"]
}
