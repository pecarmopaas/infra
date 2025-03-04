variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
}

variable "naming_location" {
  description = "The location/region to use for naming resources."
  type        = string
}

variable "environment" {
  description = "The environment in which the resources will be created."
  type        = string
}

variable "app_name" {
  description = "The name of the image to use for the container."
  type        = string
}

variable "cpu" {
  description = "The number of CPU cores to allocate to the container."
  type        = number
}

variable "memory" {
  description = "The amount of memory to allocate to the container."
  type        = string
}

variable "revision_mode" {
  description = "The revision mode to use for the container."
  type        = string
}

variable "container_app_environment_id" {
  description = "The ID of the container app environment to use for the container."
  type        = string
}

variable "acr_id" {
  description = "The ID of the Azure Container Registry to use for the container."
  type        = string
}

variable "allow_insecure_connections" {
  description = "Whether to allow insecure connections to the container."
  type        = bool
}

variable "external_enabled" {
  description = "Whether the container is externally accessible."
  type        = bool
}

variable "transport" {
  description = "The transport protocol to use for the container."
  type        = string
}

variable "latest_revision" {
  description = "Whether to route traffic to the latest revision of the container."
  type        = bool
}

variable "percentage" {
  description = "The percentage of traffic to route to the container."
  type        = number
}

variable "target_port" {
  description = "The port to use for the container."
  type        = number
}

variable "identity_id" {
  description = "The ID of the managed identity to use for the container."
  type        = string
}
