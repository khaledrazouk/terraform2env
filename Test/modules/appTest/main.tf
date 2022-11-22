resource "azurerm_app_service_plan" "planTest" {
  name                = "${var.global.naming.planTest}"
  location            = "${var.global.config.location}"
  resource_group_name = "${var.global.naming.rgTest}"
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appTest" {
  name                = "${var.global.naming.appTest}"
  location            = "${var.global.config.location}"
  resource_group_name = "${var.global.naming.rgTest}"
  app_service_plan_id = azurerm_app_service_plan.planTest.id

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
