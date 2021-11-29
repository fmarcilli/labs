resource "azurerm_app_service_plan" "service-plan" {
  name                = "ServiceAPP-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
   kind = "Linux"
  reserved = true

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "app-service" {
  name                = "APP-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

 tags = {
    environment = "dev"
    desc = "lab"
  }
#  site_config {
#    dotnet_framework_version = "v4.0"
#    scm_type                 = "LocalGit"
#  }
}