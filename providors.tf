terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.16.0"
    }
  }
    backend "azurerm" {
    resource_group_name  = "shared-resources"
    storage_account_name = "tfstat001"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  # key delete for safety
    access_key           = ""

  }

  required_version = ">= 0.14"
}

provider "azurerm" {
  features {}
}

