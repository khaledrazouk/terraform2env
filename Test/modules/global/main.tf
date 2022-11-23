locals {

  resource     = "khaled"
  resource_env = "Test"

}

output "naming" {
  value = {
     resource     = local.resource
    resource_env = local.resource_env

    rgTest  = "rg-khaled-test"
    planTest = "plan-khaled-Test"
    appTest = "khaledApp-service-Test" 
    vNetTest ="khaled-vnet-Test"
    subnetTest1 = "khaled-subnet-test1"
    netInterfaceTest = "khaled-net-interface"
    windowsVmTest = "khaled-vm-test"

  }
}

output "config" {
  value = {
    location          = "West Europe"  
  }
}