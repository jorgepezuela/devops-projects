#-----------------------------------
# Local Declarations
#-----------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp[*].name, azurerm_resource_group.rg[*].name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp[*].location, azurerm_resource_group.rg[*].location, [""]), 0)
  roles_map           = { for role in var.roles : "${role.principal_id}.${role.role}" => role }
}

#-----------------------------------
# Resources
#-----------------------------------

data "azurerm_resource_group" "rgrp" {
  name = var.resource_group_name
  count = var.create_resource_group == false ? 1 : 0
}

resource "azurerm_resource_group" "rg" {
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = merge({ "ResourceName" = format("%s", var.resource_group_name) }, var.tags, )
  count    = var.create_resource_group ? 1 : 0
}

resource "azurerm_container_registry" "acr" {
  name                = var.name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
  quarantine_policy_enabled = var.sku == "Premium" ? var.quarantine_policy_enabled : false
  trust_policy_enabled = var.sku == "Premium" ? var.trust_policy_enabled : false
  retention_policy_in_days = var.sku == "Premium" ? var.retention_policy_in_days : null
  public_network_access_enabled = var.public_network_access_enabled

  identity {
    type = var.identity_type
    identity_ids = var.identity_ids
  }
  
  dynamic "encryption" {
    for_each = var.encryption.enabled == true && var.encryption.key_vault_key_id != null && var.encryption.key_vault_id != null ? ["encryption_activated"] : []
    content {
      key_vault_key_id = var.encryption.key_vault_key_id
      identity_client_id = var.encryption.identity_client_id
    }
  }
  
  tags                = merge({ "ResourceName" = lower(var.name) }, var.tags, )

  dynamic "georeplication" {
    for_each = var.sku == "Premium" ? ["georeplica_activated"] : []
    content {
      location = var.georeplication.location
      zone_redundancy_enabled = var.zone_redundancy_enabled
    }
  }
}

resource "azurerm_role_assignment" "role" {
  for_each = local.roles_map

  scope    = azurerm_container_registry.acr.id
  role_definition_id = each.value.role
  principal_id = each.value.principal_id
}