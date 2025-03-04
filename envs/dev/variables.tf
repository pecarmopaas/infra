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

variable "users_service_app_name" {
  type = string
}

variable "users_service_cpu" {
  type = number
}

variable "users_service_memory" {
  type = string
}

variable "revision_mode" {
  type = string
}

variable "aks_principal_id" {
  type = string
}

variable "allow_insecure_connections" {
  type = bool
}

variable "external_enabled" {
  type = bool
}

variable "transport" {
  type = string
}

variable "latest_revision" {
  type = bool
}

variable "percentage" {
  type = number
}

variable "target_port" {
  type = number
}
