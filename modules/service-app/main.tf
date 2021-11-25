resource "azurerm_app_service_plan" "service-plan" {
  name                = "example-appserviceplan"
  location            = var.location
  resource_group_name = var.rg_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app-service" {
  name                = "example-app-service"
  location            = var.location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
