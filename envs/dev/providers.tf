provider "azurerm" {
  features {}
  subscription_id = "ed8f3942-5871-47a3-b546-c5fa758b2abb"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token

}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.20.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-neu-terraform"
    storage_account_name = "stneuterraform"
    container_name       = "infracontainer"
    key                  = "dev.tfstate"
  }
}
