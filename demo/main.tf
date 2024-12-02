terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true

}

resource "azurerm_resource_group" "main" {
  name     = "my-resource-group"
  location = "eastus"

}