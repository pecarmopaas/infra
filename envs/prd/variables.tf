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
  type = string
  default = "all"
}

# NETWORKING VARIABLES
variable "vnet_address_space" {
  type = list(string)
}

variable "general_subnet_address_prefix" {
  type = list(string)
}