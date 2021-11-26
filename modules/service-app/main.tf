resource "azurerm_app_service_plan" "service-plan" {
  name                = "marcilli-service-plan" 
  location            = var.location
  resource_group_name = var.rg_name

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "app-service" {
  name                = "marcilli-app-service"
  location            = var.location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

#  site_config {
#    dotnet_framework_version = "v4.0"
#    scm_type                 = "LocalGit"
#  }
}