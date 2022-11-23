
resource "azurerm_virtual_network" "vNet" {
  name                = var.global.naming.vNet
  address_space       = ["10.0.0.0/16"]
  location            = var.global.config.location
  resource_group_name = var.global.naming.rgProd
}

resource "azurerm_subnet" "subnetProd" {
  name                 = var.global.naming.subnetProd
  resource_group_name  = var.global.naming.rgProd
  virtual_network_name = var.global.naming.vNet
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "netInterface" {
  name                = var.global.naming.netInterface
  location            = var.global.config.location
  resource_group_name = var.global.naming.rgProd
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetProd.id
    private_ip_address_allocation = "Dynamic"
  }
}
# i have to add a public ip to be able to connect to my vm mr i can link it with a load balancer wich has a public ip

resource "azurerm_windows_virtual_machine" "windowsVm" {
  name                = var.global.naming.windowsVm
  resource_group_name = var.global.naming.rgProd
  location            = var.global.config.location
  size                = "Standard_F2"
  admin_username      = "khaled_razouk"
  admin_password      = "1a1a1a1a1a1A"
  network_interface_ids = [
    azurerm_network_interface.netInterface.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}