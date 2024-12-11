
provider "azurerm" {
  features {}
  skip_provider_registration = true
  storage_use_azuread        = true
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group provided by the lab."
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "primaryvnet" {
  name                = "vnet-prod-01"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  address_space = ["172.16.0.0/24"]
}

resource "azurerm_virtual_network" "secondaryvnet" {
  name                = "vnet-prod-02"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "secondary-subnet-01" {
  virtual_network_name = azurerm_virtual_network.secondaryvnet.name
  address_prefixes     = ["10.0.0.0/24"]
  name                 = "secondary-subnet-01"
  resource_group_name  = data.azurerm_resource_group.main.name

}
