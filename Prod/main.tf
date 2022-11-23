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
      version = "2.99.0"
    }
  }
}
provider "azurerm" {
  features {}
}


module "resourceGroupProd" {
  source = "./modules/resourceGroupeProd"
    global = {
    naming = module.global.naming
    config = module.global.config
  }
}
module "global" {
  source = "./modules/global"
}

module "appProd" {
  source  = "./modules/appProd"
  /* rg_name = module.resourceGroupProd.rgProd.name */

    global = {
    naming = module.global.naming
    config = module.global.config
  }
  depends_on = [
    module.resourceGroupProd
    ]

}

module "virtualMachineWindows" {
  source = "./modules/virtualMachineWindows"
  
   global = {
    naming = module.global.naming
    config = module.global.config
  }
  depends_on = [
    module.resourceGroupProd
    ]
}

