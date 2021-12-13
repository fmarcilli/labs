resource "azurerm_windows_virtual_machine" "vmwindows" {
  for_each = toset(var.vm_name)
  name = each.value
 
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.net-int-vmwin[each.key].id]
  

  os_disk {
     name = "${each.key}-disk1"
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
 
for_each = toset(var.vm_name)
name = "${each.value}-NET"

  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public-marcilli[each.key].id
  }
}

# Create public IPs
resource "azurerm_public_ip" "public-marcilli" {

for_each = toset(var.vm_name)
name = "${each.value}-PIP"

    location                     = var.location
    resource_group_name          = var.rg_name
    allocation_method            = "Dynamic"

   
}