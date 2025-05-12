terraform {

  backend "azurerm" {
    resource_group_name  = "resource-group-name"
    storage_account_name = "storage-account-name"
    container_name       = "container-name"
    subscription_id      = "subscription-id"
    tenant_id            = "tenant-id"
  }
}
