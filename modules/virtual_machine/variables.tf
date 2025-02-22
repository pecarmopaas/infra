variable "location" {
  type = string
}
variable "naming_location" {
  type = string
}
variable "app_name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "vm_size" {
  type = string
}
variable "delete_os_disk_on_termination" {
  type = bool
}
variable "delete_data_disks_on_termination" {
  type = bool
}
variable "image_publisher" {
  type = string
}
variable "image_offer" {
  type = string
}
variable "image_sku" {
  type = string
}
variable "image_version" {
  type = string
}
variable "caching" {
  type = string
}
variable "create_option" {
  type = string
}
variable "managed_disk_type" {
  type = string
}
variable "hostname" {
  type = string
}
variable "admin_username" {
  type = string
}
variable "admin_password" {
  type      = string
  sensitive = true
}
variable "environment" {
  type = string
}
variable "pip_allocation_method" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "private_ip_address_allocation" {
  type = string
}
variable "public_ip_address_id" {
  type = string
}
