
resource "azurerm_resource_group" "rgTest" {
  name     = "${var.global.naming.rgTest}"
  location = "${var.global.config.location}"
}


