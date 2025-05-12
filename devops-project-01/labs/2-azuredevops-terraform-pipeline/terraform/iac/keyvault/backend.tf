terraform {

  backend "azurerm" {
    resource_group_name  = "resource_group_name"
    storage_account_name = "storage_account_name"
    container_name       = "container_name"
    subscription_id      = "subscription_id"
    tenant_id            = "tenant_id"
  }
}
