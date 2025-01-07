terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }

  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {

  }
}

variable "resource_group_name" {
  description = "Name of resource group provided by the lab."
  type        = string
}

variable "location" {
  description = "location"
  type        = string

}

variable "storage_account_name" {
  description = "storage account name"
  type        = string

}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  account_tier             = "Standard"
  account_replication_type = "LRS"
  location                 = var.location
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name

}