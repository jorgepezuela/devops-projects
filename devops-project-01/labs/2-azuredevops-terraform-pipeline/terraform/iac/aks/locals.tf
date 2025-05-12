locals {
  tags = {
    "application"    = format("aks-%s", lower(var.environment))
    "classification" = "na"
    "costcenter"     = "na"
    "createdwith"    = "terraform"
    "creator"        = "na"
    "criticality"    = "na"
    "datecreated"    = "na"
    "environment"    = format("%s", lower(var.environment))
    "expires"        = "na"
    "owner"          = "na"
    "team"           = "na"
  }
  loc      = var.loc
  location = var.location
  # tflint-ignore: terraform_unused_declarations
  sku_tier = "Paid"
}
