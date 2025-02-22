variable "environment" {
  type = string
}

variable "app_name" {
  type = string
}

variable "location" {
  type        = string
  description = "The location for the Key Vault."
}

variable "naming_location" {
  type        = string
  description = "The location for naming resources."
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name for the Key Vault."
}

variable "sku_name" {
  type        = string
  description = "The SKU name for the Key Vault."
  default     = "standard"
}
