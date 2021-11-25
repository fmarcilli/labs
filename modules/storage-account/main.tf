resource "azurerm_storage_account" "sto-account" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.rg_all.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}