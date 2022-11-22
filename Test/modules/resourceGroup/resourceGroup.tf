
resource "azurerm_resource_group" "rg" {
  name     = "${var.resourceGrName}"
  location = "${var.location}"
}