#-------------------------------
# Common Variables
#-------------------------------
variable "environment" {
  type        = string
  description = "Name of the environment."
}

variable "vnet_resource_group" {
  type        = string
  description = "Name of the resource group for the virtual network."
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network."
}

variable "address_prefixes" {
  type        = list(string)
  description = "Address prefix for the subnet."
}

variable "loc" {
  type        = string
  description = "short location"
}

variable "location" {
  type        = string
  description = "long location"
}

variable "route_internet" {
  type        = string
  description = "Internet Appliance"
  default     = "172.29.96.132"
}

variable "route_internal" {
  type        = string
  description = "Internal Appliance"
  default     = "172.29.96.132"
}

# tflint-ignore: terraform_unused_declarations
variable "sku_tier" {
  type        = string
  description = "SKU for the K8S (Paid or Free)"
  default     = "Free"
}

variable "product_name" {
  type        = string
  description = "Product name for the components"
  default     = ""
}

# tflint-ignore: terraform_unused_declarations
variable "rabbit_node_pool_enabled" {
  description = "Enable rabbitmq node pool"
  type        = bool
  default     = false
}
