#Utilizando count

# resource "azurerm_storage_account" "sto-account" {
#   count = 2
#   name                     = "sto${lower(var.project_name)}${lower(var.environment)}${count.index}"
#   resource_group_name      = var.rg_name
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"

#   tags = {
#     environment = "DEV"
#   }
# }


#Utilizando for each
resource "azurerm_storage_account" "sto-account" {
for_each = toset(["st1", "st2"])
name = each.key

  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "DEV"
  }
}