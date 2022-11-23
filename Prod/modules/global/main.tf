locals {

  resource     = "khaled"
  resource_env = "Prod"

}

output "naming" {
  value = {
     resource     = local.resource
    resource_env = local.resource_env

    rgProd  = "rg-khaled"
    planProd = "plan-khaled"
    appProd = "app-khaled" 
    vNet ="khaled-vnet"
    subnetProd = "khaled-subnet"
    netInterface = "khaled-net-interface"
    windowsVm = "khaled-vm"

  }
}

output "config" {
  value = {
    location          = "West Europe"  
  }
}