module "naming_simple" {
  source       = "../../terraform-azurerm-naming"
  product_name = var.product_name
  env          = var.environment
  location     = local.loc
}

data "azurerm_resource_group" "main" {
  name = var.vnet_resource_group
}

data "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.main.name
}

data "azurerm_subnet" "main" {
  name                 = module.naming_simple.subnet.name
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = data.azurerm_virtual_network.main.name
}

data "azurerm_user_assigned_identity" "main" {
  resource_group_name = module.naming_simple.resource_group.name
  name                = module.naming_simple.user_assigned_identity.name
}

# tflint-ignore: terraform_unused_declarations
data "azurerm_proximity_placement_group" "main" {
  name                = module.naming_simple.proximity_placement_group.name
  resource_group_name = module.naming_simple.resource_group.name
}

#tfsec:ignore:azure-container-logging
module "kubernetes" {
  source                              = "../../terraform-azurerm-kubernetes"
  name                                = module.naming_simple.kubernetes_cluster.name
  prefix                              = module.naming_simple.kubernetes_cluster.name
  resource_group_name                 = module.naming_simple.resource_group.name
  default_vm_size                     = var.default_vm_size
  os_disk_size_gb                     = var.os_disk_size_gb
  create_resource_group               = false
  location                            = local.location
  private_cluster_enabled             = true
  private_dns_zone_id                 = "None"
  private_cluster_public_fqdn_enabled = true
  outbound_type                       = "userDefinedRouting"
  identity_type                       = "UserAssigned"
  user_assigned_identity_id           = [data.azurerm_user_assigned_identity.main.id]
  kubelet_client_id                   = data.azurerm_user_assigned_identity.main.client_id
  kubelet_object_id                   = data.azurerm_user_assigned_identity.main.principal_id
  kubelet_user_assigned_identity_id   = data.azurerm_user_assigned_identity.main.id
  availability_zones                  = ["1", "2"]
  vnet_subnet_id                      = data.azurerm_subnet.main.id
  node_count                          = 1
  run_command_enabled                 = true
  linux_node_pool_enabled             = true
  linux_vm_size                       = "Standard_D8ds_v5"
  linux_os_disk_size_gb               = 100
  linux_vnet_subnet_id                = data.azurerm_subnet.main.id
  enable_linux_auto_scaling           = true
  max_default_linux_node_count        = 4
  min_default_linux_node_count        = 1
  oms_agent_enabled                   = false
  tags                                = local.tags
  sku_tier                            = var.sku_tier
}

resource "azurerm_kubernetes_cluster_node_pool" "rabbitpool" {
  count                 = var.rabbit_node_pool_enabled ? 1 : 0
  kubernetes_cluster_id = module.kubernetes.aks_id
  name                  = "rabbitpool"
  vm_size               = "Standard_D4ds_v5"
  os_disk_size_gb       = 100
  os_disk_type          = "Ephemeral"
  vnet_subnet_id        = data.azurerm_subnet.main.id
  enable_auto_scaling   = false
  max_count             = 0
  min_count             = 0
  max_pods              = 30
  os_type               = "Linux"
  node_taints           = ["RabbitMQOnly=true:NoSchedule"]

  lifecycle {
    ignore_changes = [
      node_count, enable_auto_scaling, max_count, min_count
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "spaspool" {
  count                 = var.spa_node_pool_enabled ? 1 : 0
  kubernetes_cluster_id = module.kubernetes.aks_id
  name                  = "spaspool"
  vm_size               = "Standard_D38ds_v5"
  os_disk_size_gb       = 100
  os_disk_type          = "Ephemeral"
  vnet_subnet_id        = data.azurerm_subnet.main.id
  enable_auto_scaling   = true
  max_count             = 4
  min_count             = 1
  max_pods              = 110
  os_type               = "Linux"
  node_taints           = ["SPAOnly=true:NoSchedule"]

  lifecycle {
    ignore_changes = [
      node_count, enable_auto_scaling, max_count, min_count
    ]
  }
}
