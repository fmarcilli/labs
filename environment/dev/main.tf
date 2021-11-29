terraform {
    
    backend "azurerm" {
    resource_group_name  = "RG-Terraform"
    storage_account_name = "terraformmarcilli"
    container_name       = "envi-lab"
    key                  = "dev-terraform.tfstate"
    }
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

# # Storage Account Module
module "azurerm_storage_account"{
  source = "../../modules/storage-account"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = module.resource_group.location
  rg_name             = module.resource_group.name
    
}


# # VM Module
module "azurerm_virtual_machine"{
  source = "../../modules/VM"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = module.resource_group.location
  rg_name             = module.resource_group.name
  nics = {
    nic1 = {
      subnet_id = module.azurerm_subnet.subnet_id
      enable_accelerated_networking = "true"
      primary = "true"
    }
   
}



# VNET Module
module "azurerm_virtual_network"{
  source = "../../modules/vnet"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = module.resource_group.location
  rg_name             = module.resource_group.name
  vnet_name = "marcilli-network"
  address_space = ["10.0.0.0/16"]
  address_prefixes = ["10.0.2.0/24"]
}









# Service Plan Module
# module "azurerm_app_service_plan"{
#   source = "../../modules/service-app"
#   project_name        = "FilipeLABS"
#   environment         = "dev"
#   location            = module.resource_group.location
#   rg_name             = module.resource_group.name
    
# }

# Service App Module
# module "azurerm_app_service"{
#   source = "../../modules/service-app"
#   project_name        = "FilipeLABS"
#   environment         = "dev"
#   location            = module.resource_group.location
#   rg_name             = module.resource_group.name
  
   
# }