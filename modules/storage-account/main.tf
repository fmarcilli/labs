resource "azurerm_storage_account" "sto-account" {
  name                     = "sto${lower(var.project_name)}${lower(var.environment)}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "DEV"
  }
}

