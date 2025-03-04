variable "naming_location" {
  type        = string
  description = "Location prefix for resources"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "resource_group_id" {
  type        = string
  description = "Resource group ID"
}

variable "kubernetes_version" {
  type        = string
  description = "AKS version"
}

variable "node_count" {
  type        = number
  description = "Default node count"
}

variable "vm_size" {
  type        = string
  description = "VM size for nodes"
}

variable "os_disk_size_gb" {
  type        = number
  description = "OS disk size in GB"
  default     = 30
}

variable "aks_principal_id" {
  type        = string
  description = "Principal ID for AKS"
}
