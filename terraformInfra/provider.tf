terraform {
  required_version = ">=1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "1-5c79bc69-playground-sandbox"
    storage_account_name = "mystorageaccount23" # Wie wird durch env Var eingeschoben?
    container_name       = "tfstate"
    key                  = "infra.tfstate"
  }
}

provider "azurerm" {
  features {}

  resource_provider_registrations = "none"
}