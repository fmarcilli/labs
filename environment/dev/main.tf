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
module "RESOURCE-GROUP"{
  source = "../../modules/resource-group"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = "EastUS"
   
}

# # Storage Account Module
module "STORAGE-ACCOUNT"{
  source = "../../modules/storage-account"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = module.resource-group.location
  rg_name             = module.resource-group.name
    
}


# VNET Module
module "VNETS"{
  source = "../../modules/vnet"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = module.resource-group.location
  rg_name             = module.resource-group.name
  vnet_name           = "vnetlab"
  address_space       = ["10.0.0.0/16"]
  address_prefixes    = ["10.0.2.0/24"]
  
  }
  
    

# # VM Module
module "VMS"{
  source = "../../modules/VM"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = module.resource-group.location
  rg_name             = module.resource-group.name
  subnet_id           = module.azurerm_virtual_network.vnet_subnet
   
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