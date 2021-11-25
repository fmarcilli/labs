# Resource Group

resource "azurerm_resource_group" "rg_all" {
  name     = "RG-${var.project_name}-${var.environment}"
  location = var.location
}

output "rg_all" {
  description = "RG criado com sucesso"
  location = var.location
  name = "RG-${var.project_name}-${var.environment}"
  value = data.azurerm_resource_group.rg_all.id
}