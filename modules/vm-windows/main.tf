resource "azurerm_windows_virtual_machine" "vmwindows" {
for_each = toset(["vm-${var.project_name}-${var.environment}1","vm-${var.project_name}-${var.environment}2"])
name = each.key


  #name                = "VMWIN-${var.environment}"
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
   # azurerm_network_interface.net-int-vmwin.id,
   azurerm_network_interface.net-int-vmwin[each.key]
  ]

  os_disk {
    #name                 = "VM-DISK-${var.project_name}-${var.environment}"

for_each = toset(["vm-${var.project_name}-${var.environment}1","vm-${var.project_name}-${var.environment}2"])
name = each.key

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


resource "azurerm_network_interface" "net-int-vmwin" {
  #name                = "NIC1-${var.project_name}-${var.environment}"
for_each = toset(["NIC-${var.project_name}-${var.environment}1","NIC-${var.project_name}-${var.environment}2"])
name = each.key

  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}