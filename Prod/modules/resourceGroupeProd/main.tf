
resource "azurerm_resource_group" "rgProd" {
  name     = "${var.global.naming.rgProd}"
  location = "${var.global.config.location}"
}