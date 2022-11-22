# call the resource group

resource "azurerm_app_service_plan" "planProd" {
  name                = "${var.global.naming.planProd}"
  location            = "${var.global.config.location}"
  resource_group_name = "${var.global.naming.rgProd}"
  sku {
    tier = "Standard"
    size = "S1"
  }
}
# i have to put output 



resource "azurerm_app_service" "appProd" {
  name                = "${var.global.naming.appProd}"
  location            = "${var.global.config.location}"
  resource_group_name = "${var.global.naming.rgProd}"
  app_service_plan_id = azurerm_app_service_plan.planProd.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}

