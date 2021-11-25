resource "azurerm_storage_account" "sto-account" {
  name                     = "STO-${var.project_name}-${var.environment}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "DEV"
  }
}
