terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      "source" = "hashicorp/azurerm"
      version  = "3.43.0"
    }
  }
  
  cloud { 
    
    organization = "streamless-the-org" 

    workspaces { 
      name = "hello-workspace" 
    } 
  } 
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "810-374d2b91-migrate-terraform-state-to-terraform"
  location = "eastus"
}

