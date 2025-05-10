#-------------------------------
# ACR Variables
#-------------------------------

variable "name" {
  type        = string
  description = "Name of the Azure Container Registry."
}

variable "sku" {
  type        = string
  default     = "Basic"
  description = "The SKU name of the container registry."

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "ERROR: Invalid SKU Tier must be one of Basic, Standard or Premium."
  }
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Name of the default object location."
}

variable "resource_group_name" {
  type        = string
  default     = "acr-resource-group"
  description = "Name of the Azure Container Registry resource group."
}

variable "identity_type" {
  description = "The type of Managed Identity which should be assigned to the Container Registry. Possible values are 'SystemAssigned', 'UserAssigned' and 'SystemAssigned, UserAssigned'. If 'UserAssigned' is set, a 'user_assigned_identity_id' must be set as well."
  type        = string
  default     = "SystemAssigned"
}

variable "identity_ids" {
  type        = list(string)
  description = "(Optional) A list of User Managed Identity ID's which should be assigned to the Container Registry."
  default     = null
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
