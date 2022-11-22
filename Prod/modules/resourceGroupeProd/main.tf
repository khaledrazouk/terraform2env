
resource "azurerm_resource_group" "rgProd" {
  name     = "${var.resourceGrName}"
  location = "${var.location}"
}