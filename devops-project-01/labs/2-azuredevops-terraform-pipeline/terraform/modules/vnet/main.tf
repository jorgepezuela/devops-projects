#-----------------------------------
# Local Declarations
#-----------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp[*].name, azurerm_resource_group.rg[*].name, [""]), 0)
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

#-----------------------------------
# Virtual Network
#-----------------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  bgp_community       = var.bgp_community
  edge_zone           = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes

  tags                = merge({ "ResourceName" = lower(var.name) }, var.tags, )
}