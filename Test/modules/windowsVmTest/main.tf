
resource "azurerm_virtual_network" "vNetTest" {
  name                = var.global.naming.vNetTest
  address_space       = ["10.0.0.0/16"]
  location            = var.global.config.location
  resource_group_name = var.global.naming.rgTest
}

resource "azurerm_subnet" "subnetTest1" {
  name                 = var.global.naming.subnetTest1
  resource_group_name  = var.global.naming.rgTest
  virtual_network_name = var.global.naming.vNetTest
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "netInterfaceTest" {
  name                = var.global.naming.netInterfaceTest
  location            = var.global.config.location
  resource_group_name = var.global.naming.rgTest
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetTest1.id
    private_ip_address_allocation = "Dynamic"
  }
}
# i have to add a public ip to be able to connect to my vm mr i can link it with a load balancer wich has a public ip
# if there is a bug in the test env a have to run terraform apply another time and it will work it just a problem of names 
# and must delete the vnet manually 
resource "azurerm_windows_virtual_machine" "windowsVmTest" {
  name                = var.global.naming.windowsVmTest
  resource_group_name = var.global.naming.rgTest
  location            = var.global.config.location
  size                = "Standard_F2"
  admin_username      = "khaled_razouk"
  admin_password      = "1a1a1a1a1a1A"
  network_interface_ids = [
    azurerm_network_interface.netInterfaceTest.id,
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