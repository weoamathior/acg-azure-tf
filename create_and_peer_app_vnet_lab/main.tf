locals {
  vnet_name = "${var.naming_prefix}-taconet"
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

module "app_vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.1.0"
  # insert the 3 required variables here

  resource_group_name = data.azurerm_resource_group.main.name
  vnet_location       = data.azurerm_resource_group.main.location
  use_for_each        = true

  vnet_name       = local.vnet_name
  address_space   = var.vnet_address_space
  subnet_names    = keys(var.subnet_configuration)
  subnet_prefixes = values(var.subnet_configuration)

  tags = var.common_tags
}

data "azurerm_virtual_network" "hub" {
  resource_group_name = var.hub_vnet.resource_group_name
  name                = var.hub_vnet.name
}

resource "azurerm_virtual_network_peering" "spoke_2_hub" {
  name                      = "${module.app_vnet.vnet_name}-to-${var.hub_vnet.name}"
  resource_group_name       = data.azurerm_resource_group.main.name
  virtual_network_name      = module.app_vnet.vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.hub.id
}

resource "azurerm_virtual_network_peering" "hub_2_spoke" {
  name                      = "${var.hub_vnet.name}-to-${module.app_vnet.vnet_name}"
  resource_group_name       = var.hub_vnet.resource_group_name
  virtual_network_name      = var.hub_vnet.name
  remote_virtual_network_id = module.app_vnet.vnet_id
}
