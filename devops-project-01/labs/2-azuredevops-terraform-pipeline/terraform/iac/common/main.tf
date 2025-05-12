module "naming_simple" {
  source       = "../../terraform-azurerm-naming"
  product_name = var.product_name
  env          = var.environment
  location     = local.loc
}

data "azurerm_resource_group" "vnet" {
  name = var.vnet_resource_group
}

data "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.vnet.name
}

module "subnet" {
  source                   = "../../terraform-azurerm-subnet"
  name                     = module.naming_simple.subnet.name
  create_resource_group    = false
  virtual_network_name     = data.azurerm_virtual_network.main.name
  vnet_resource_group_name = data.azurerm_resource_group.vnet.name
  resource_group_name      = module.naming_simple.resource_group.name
  address_prefixes         = var.address_prefixes
  route_table_name         = azurerm_route_table.main.name
  service_endpoints        = local.service_endpoints

  depends_on = [
    azurerm_route_table.main
  ]
}

resource "azurerm_resource_group" "main" {
  #ts:skip=AC_AZURE_0389 RSG lock should be skipped for now.
  name     = module.naming_simple.resource_group.name
  location = local.location
  tags     = local.tags
}

resource "azurerm_route_table" "main" {
  name                          = module.naming_simple.route_table.name
  resource_group_name           = azurerm_resource_group.main.name
  location                      = local.location
  disable_bgp_route_propagation = true
  route {
    name                   = "default"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.route_internet
  }

  route {
    name                   = "dns-subnet"
    address_prefix         = "172.29.98.32/27"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.route_internal
  }

  tags = local.tags
  lifecycle {
    ignore_changes = [route, tags]
  }

}

resource "azurerm_user_assigned_identity" "main" {
  resource_group_name = azurerm_resource_group.main.name
  name                = module.naming_simple.user_assigned_identity.name
  location            = local.location
  tags                = local.tags
}

resource "azurerm_role_assignment" "main" {
  scope                = data.azurerm_virtual_network.main.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.main.principal_id
}

resource "azurerm_role_assignment" "route" {
  scope                = azurerm_route_table.main.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.main.principal_id
}

resource "azurerm_role_assignment" "resourcegroup" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_user_assigned_identity.main.principal_id
}

resource "azurerm_proximity_placement_group" "main" {
  name                = module.naming_simple.proximity_placement_group.name
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    environment = "Production"
  }
}
