variable "subnet_address_prefixes" {
  type = list(string)
}

variable "resource_group_name" {
  type = string
}

variable "environment" {
  type = string 
}

variable "naming_location" {
  type = string
}

variable "virtual_network_name" {
  type = string
}