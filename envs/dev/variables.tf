# GENERAL VARIABLES
variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "naming_location" {
  type = string
}

variable "general_resources_app_name" {
  type    = string
  default = "all"
}

# NETWORKING VARIABLES
variable "vnet_address_space" {
  type = list(string)
}

variable "general_subnet_address_prefix" {
  type = list(string)
}

# AKS VARIABLES
variable "kubernetes_version" {
  type = string
}

variable "node_count" {
  type = number
}

variable "vm_size" {
  type = string
}

variable "os_disk_size_gb" {
  type = number
}

variable "aks_sp_name" {
  type = string
}
