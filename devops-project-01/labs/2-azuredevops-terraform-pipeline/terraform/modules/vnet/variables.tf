#-------------------------------
# Common Variables
#-------------------------------
variable "location" {
  type        = string
  default     = "westeurope"
  description = "Name of the default object location."
}

variable "name" {
  type        = string
  description = "Name of the Azure Container Registry."
}

variable "resource_group_name" {
  type        = string
  default     = "acr-resource-group"
  description = "Name of the Azure Container Registry resource group."
}

variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
  default     = true
  type        = bool
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network."
}

variable "dns_servers" {
  type        = list(string)
  description = "The list of DNS server IP addresses."
}

variable "bgp_community" {
  type        = string
  description = "The BGP community to be used for the virtual network."
}

variable "edge_zone" {
  type        = string
  description = "The edge zone to be used for the virtual network."
}

variable "flow_timeout_in_minutes" {
  type        = number
  description = "The flow timeout in minutes for the virtual network."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources created."
}