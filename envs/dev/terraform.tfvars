environment     = "dev"
location        = "northeurope"
naming_location = "neu"

vnet_address_space            = ["10.0.0.0/23"]
general_subnet_address_prefix = ["10.0.0.0/24"]

kubernetes_version = "1.30.0"
node_count         = 1
vm_size            = "Standard_D2as_v4"
os_disk_size_gb    = 30
aks_sp_name        = "sp-neu-dev-aks"
