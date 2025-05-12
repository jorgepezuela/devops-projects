locals {
  tags = {
    "application"    = format("aks-keyvault-%s", lower(var.environment))
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
}
