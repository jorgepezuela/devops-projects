resource "azurerm_resource_group" "acr_resource_group" {
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = merge({ "ResourceName" = format("%s", var.resource_group_name) }, var.tags, )
}

resource "azurerm_container_registry" "acr" {
  name                      = var.name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  sku                       = var.sku
  admin_enabled             = var.admin_enabled

  identity {
    type         = var.identity_type
    identity_ids = var.identity_ids
  }
}
