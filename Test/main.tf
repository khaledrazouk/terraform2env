terraform {
  backend "azurerm" {
    resource_group_name  = "khaled_perso"
    storage_account_name = "khaledstore"
    container_name       = "khaledcontainer"
    key                  = "Test.terraform.tfstate"

  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.32.0"
    }
  }
}
provider "azurerm" {
  features {}
}


module "resourceGroupTest" {
  source = "./modules/resourceGroup"
  /* tags   = var.tags */

}


module "appTest" {
  source = "./modules/appTest"

}
