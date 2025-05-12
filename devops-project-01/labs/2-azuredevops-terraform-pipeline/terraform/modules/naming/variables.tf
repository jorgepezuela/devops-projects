variable "architecture" {
  type        = string
  default     = "narm"
  description = "Name of architecture"


  validation {
    condition     = can(regex("^[a-z]{4,7}$", var.architecture))
    error_message = "Product name can have from 5 up to 7 characters. Only lowercase letters."
  }
}

variable "product_name" {
  type        = string
  default     = "global"
  description = "Name of product or \"global\" in case of a shared resource group"


  validation {
    condition     = can(regex("^[a-z0-9-]{3,20}$", var.product_name))
    error_message = "Product name can have from 3 up to 20 characters. Only lowercase letters and numbers."
  }
}

variable "instance_id" {
  type        = string
  default     = ""
  description = "(Optional) In case it is required to deploy several resources of the same resource type in the Resource Group, an list of IDs should be used to distinguish between them"

  validation {
    condition     = can(regex("^([a-z0-9]{2,4}|^$)$", var.instance_id))
    error_message = "Instance ID can have up to 2 characters."
  }


  #   validation {
  #     condition = alltrue([
  #       for item in var.instance_id : can(regex("^([a-z0-9]{2,4}|^$)$", item))
  #     ])
  #     # can(regex("^([a-z0-9]{2,4}|^$)$", var.instance_id))
  #     error_message = "Resource ID can have from 2 up to 4 characters."
  #   }
}

variable "env" {
  type        = string
  default     = "poc"
  description = "Identifies the environment"

  validation {
    condition     = can(regex("^(poc|dev|stg|prd|hub)$", var.env))
    error_message = "Environment value must be a \"poc\", \"dev\", \"stg\", \"prd\" or \"hub\"."
  }
}

variable "location" {
  type        = string
  default     = "we"
  description = "Identifies the location/region where the resource is deployed"

  validation {
    condition     = can(regex("^(ne|we)$", var.location))
    error_message = "Location value must be whether \"ne\" (North Europe) or \"we\" (West Europe)."
  }
}
