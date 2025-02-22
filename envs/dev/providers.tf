provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.20.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-neu-terraform"
    storage_account_name = "stneuterraform"
    container_name       = "infracontainer"
    key                  = "dev.tfstate"
  }
}
