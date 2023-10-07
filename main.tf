terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }
  cloud {
    organization = "ghd-company"

    workspaces {
      name = "TerraformCI2"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}



data "azurerm_resource_group" "rg" {
  name = "1-89c65ed4-playground-sandbox"

}

resource "azurerm_storage_account" "storage" {
  name                     = "ghdstr008"
  location                 = data.azurerm_resource_group.rg.location
  resource_group_name      = data.azurerm_resource_group.rg.name
  account_replication_type = "LRS"
  account_tier             = "Standard"
}

resource "azurerm_storage_account" "storage2" {
  name                     = "ghdstr009"
  location                 = data.azurerm_resource_group.rg.location
  resource_group_name      = data.azurerm_resource_group.rg.name
  account_replication_type = "LRS"
  account_tier             = "Standard"
}

resource "azurerm_storage_blob" "blob1" {
  name = "ghdcont"
  type = "Block"
  storage_container_name = "ghdcont"
  storage_account_name = azurerm_storage_account.storage.name
}