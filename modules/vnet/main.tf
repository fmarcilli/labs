# VNET

#resource "azurerm_virtual_machine" "vm" {
#  name     = "VM-${var.project_name}-${var.environment}"
#  location = var.location
#  resource_group_name = azurerm_resource_group.rg_all.name



resource "azurerm_virtual_network" "vnet" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_all.name
}

resource "azurerm_subnet" "internal" {
  name                 = "int"
  resource_group_name = azurerm_resource_group.rg_all.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "net-int" {
  name                = "example-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_all.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.net-int.id
    private_ip_address_allocation = "Dynamic"
  }
}