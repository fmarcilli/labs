terraform {
    #backend "azurerm" {}
}

provider "azurerm" {
    features {}
 }

# Resource Group Module
module "resource_group"{
  source = "../../modules/resource-group"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = "EastUS"
   
}

# Storage Account Module
module "azurerm_storage_account"{
  source = "../../modules/storage-account"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = module.resource_group.location
  rg_name             = module.resource_group.name
  
   
}

# Service Plan Module
module "azurerm_app_service_plan"{
  source = "../../modules/service-app"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = module.resource_group.location
  rg_name             = module.resource_group.name
    
}

# Service App Module
module "azurerm_app_service"{
  source = "../../modules/service-app"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = module.resource_group.location
  rg_name             = module.resource_group.name
  
   
}