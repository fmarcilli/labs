resource "azurerm_network_security_group" "nsg-lab" {
  name                = "NSG-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_rule" "nsg-sec_rule-lab" {
  name                        = "test123"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg-lab.name

}