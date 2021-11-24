terraform {
    #backend "azurerm" {}

}

provider "azurerm" {
    features {}
 }


# Resource Group Module

module "resource_group"{
  source = "../../modules/marcilli"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = "EastUS"
   
}

module "azurerm_virtual_machine"{
  source = "../../modules/marcilli"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = "EastUS"
    
}

module "azurerm_virtual_network"{
  source = "../../modules/vnet"
  #project_name        = "FilipeLABS"
  #environment         = "dev"
  #location            = "EastUS"
}

module "azurerm_subnet"{
  source = "../../modules/vnet"
 # project_name        = "FilipeLABS"
 # environment         = "dev"
 # location            = "EastUS"
}

module "azurerm_network_interface"{
  source = "../../modules/vnet"
 # project_name        = "FilipeLABS"
 # environment         = "dev"
 # location            = "EastUS"
}
