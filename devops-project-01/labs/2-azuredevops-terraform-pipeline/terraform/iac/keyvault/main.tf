module "naming_simple" {
  source       = "../../terraform-azurerm-naming"
  product_name = var.product_name
  env          = var.environment
  location     = local.loc
}

data "azurerm_log_analytics_workspace" "main" {
  name                = module.naming_simple.log_analytics_workspace.name
  resource_group_name = module.naming_simple.resource_group.name
}

module "keyvault" {
  source              = "../../terraform-azurerm-keyvault"
  name                = replace(module.naming_simple.key_vault.name, "-", "")
  resource_group_name = module.naming_simple.resource_group.name
  location            = local.location
  #tfsec:ignore:azure-keyvault-no-purge
  purge_protection_enabled     = true
  logging_enabled              = true
  log_analytics_workspace_name = data.azurerm_log_analytics_workspace.main.name
  log_analytics_resource_group = data.azurerm_log_analytics_workspace.main.resource_group_name
  tags                         = local.tags
}

# tflint-ignore: terraform_unused_declarations
data "azurerm_resource_group" "main" {
  name = var.vnet_resource_group
}
