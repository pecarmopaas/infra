environment     = "uat"
location        = "northeurope"
naming_location = "neu"

vnet_address_space            = ["10.0.2.0/23"]
general_subnet_address_prefix = ["10.0.2.0/24"]

aks_principal_id = "17f48f82-8f16-4a51-a989-70997a758c53"
#aks_principal_id   = "4e5b0051-33e3-4cad-9f16-ebaf6df0abf4"
node_count         = 1
vm_size            = "Standard_D2as_v4"
os_disk_size_gb    = 30
kubernetes_version = "1.31.3"
