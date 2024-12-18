data "azurerm_resource_group" "vmss" {
  name = var.resource_group_name
}



data "azurerm_subnet" "web" {
  resource_group_name  = data.azurerm_resource_group.vmss.name
  virtual_network_name = var.vnet_name
  name                 = var.subnet_name
}

module "tacoweb" {
  source  = "Azure/loadbalancer/azurerm"
  version = "4.4.0"

  resource_group_name = data.azurerm_resource_group.vmss.name
  location            = data.azurerm_resource_group.vmss.location

  type              = "public"
  pip_sku           = "Standard"
  allocation_method = "Static"
  lb_sku            = "Standard"
  prefix            = var.prefix


  lb_port = {
    http = ["80", "Tcp", "${var.application_port}"]
  }

  lb_probe = {
    http = ["Http", "${var.application_port}", "/"]
  }

}