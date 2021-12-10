resource "azurerm_network_security_group" "nsg-lab" {
  name                = "NSG-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_rule" "nsg-sec_rule-lab" {
  name                        = "RDP-Rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg-lab.name

}

resource "azurerm_network_security_rule" "nsg-sec_rule-lab-02" {
  name                        = "RDP-Rule"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg-lab.name

}


# security_rule{
#   name = "rule-1"
#    priority                   = 100
#    direction                  = "Inbound"
#    access                     = "Deny"
#    protocol                   = "*"
#    source_port_range          = "*"
#    destination_port_range     = "3389"
#    source_address_prefix       = "*"
#    destination_address_prefix  = "*"
#    resource_group_name         = var.rg_name
#    network_security_group_name = azurerm_network_security_group.nsg-lab.name
   

# }


resource "azurerm_subnet_network_security_group_association" "association-nsg" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.nsg-lab.id
  #network_security_group_id = azurerm_network_security_group.nsg-lab.name
}