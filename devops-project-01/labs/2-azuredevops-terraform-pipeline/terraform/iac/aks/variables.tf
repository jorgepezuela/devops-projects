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

# tflint-ignore: terraform_unused_declarations
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

# tflint-ignore: terraform_unused_declarations
variable "route_internet" {
  type        = string
  description = "Internet Appliance"
  default     = "10.217.127.40"
}

# tflint-ignore: terraform_unused_declarations
variable "route_internal" {
  type        = string
  description = "Internal Appliance"
  default     = "10.217.127.40"
}

# tflint-ignore: terraform_unused_declarations
variable "subresource_names" {
  type        = list(string)
  description = "Storage subresources"
  default     = ["blob", "file"]
}

variable "sku_tier" {
  type        = string
  description = "SKU for the K8S (Paid or Free)"
  default     = "Free"
}

variable "rabbit_node_pool_enabled" {
  description = "Enable rabbitmq node pool"
  type        = bool
  default     = false
}

variable "product_name" {
  type        = string
  description = "Product name for the components"
  default     = ""
}

variable "default_vm_size" {
  type        = string
  description = "Default VM Size for the System Node"
  default     = "Standard_D4ds_v5"
}

variable "os_disk_size_gb" {
  type        = string
  description = "Default os Disk Size"
  default     = 100
}

variable "spa_node_pool_enabled" {
  description = "Enable SPA node pool"
  type        = bool
  default     = false
}
