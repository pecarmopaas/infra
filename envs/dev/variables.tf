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

variable "aks_principal_id" {
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

variable "kubernetes_version" {
  type = string
}

variable "cloudflare_zone_id" {
  type = string
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "dns_record_name" {
  type = string
}

variable "dns_record_proxied" {
  type = bool
}

variable "dns_record_type" {
  type = string
}

variable "dns_record_ttl" {
  type = number
}
