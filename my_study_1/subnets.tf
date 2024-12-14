
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group provided by the lab."
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "main" {
  name                = "vnet-1"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/24"]
  name                 = "subnet-1"
  resource_group_name  = data.azurerm_resource_group.main.name

}

resource "azurerm_subnet" "subnet2" {
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
  name                 = "subnet-2"
  resource_group_name  = data.azurerm_resource_group.main.name

}
