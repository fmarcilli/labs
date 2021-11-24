# Resource Group

resource "azurerm_resource_group" "rg_all" {
  name     = "RG-${var.project_name}-${var.environment}"
  location = var.location
}
