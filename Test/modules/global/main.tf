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

  }
}

output "config" {
  value = {
    location          = "West Europe"  
  }
}