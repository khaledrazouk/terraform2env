terraform {
  backend "azurerm" {
    resource_group_name  = "khaled_perso"
    storage_account_name = "khaledstore"
    container_name       = "khaledcontainer"
    key                  = "Prod.terraform.tfstate"

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


module "resourceGroupProd" {
  source = "./modules/resourceGroupeProd"

  /* tags   = var.tags    */
//check the tags
}


module "appProd" {
  source  = "./modules/appProd"
  rg_name = module.resourceGroupProd.rgProd.name

  depends_on = [
    module.resourceGroupProd
    ]

}

