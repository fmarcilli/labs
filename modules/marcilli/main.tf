# Resource Group

resource "azurerm_resource_group" "rg_all" {
  name     = "RG-${var.project_name}-${var.environment}"
  location = var.location
}


# VM

resource "azurerm_virtual_machine" "vm" {
  name     = "VM-${var.project_name}-${var.environment}"
  location = var.location
  network_interface_ids = [azurerm_network_interface.vm.id]
  vm_size               = "Standard_DS1_v2"
   storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
