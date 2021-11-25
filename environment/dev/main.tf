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
 # resource_group_name = module.resource_group.name
  
   
}
