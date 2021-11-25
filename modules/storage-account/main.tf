resource "azurerm_storage_account" "sto-account" {
  name                     = "STO-${var.project_name}-${var.environment}"
  resource_group_name      = resource_group_name.rg_all.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}

