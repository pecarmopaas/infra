variable "location" {
  type = string
}

variable "sku" {
  type    = string
  default = "Basic"
}

variable "admin_enabled" {
  type    = bool
  default = true
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

variable "app_name" {
  type = string
}
