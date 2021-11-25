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
# VM Module
#module "azurerm_virtual_machine"{
 # source = "../../modules/marcilli"
#  project_name        = "FilipeLABS"
#  environment         = "dev"
#  location            = "EastUS"
    
#}

# VNET Module
#module "azurerm_virtual_network"{
#  source = "../../modules/vnet"
#  #project_name        = "FilipeLABS"
#  #environment         = "dev"
  #location            = "EastUS"
#}

# SubNET Module
#module "azurerm_subnet"{
 # source = "../../modules/vnet"
 # project_name        = "FilipeLABS"
 # environment         = "dev"
 # location            = "EastUS"
#}

# Interface Module
#module "azurerm_network_interface"{
#  source = "../../modules/vnet"
 # project_name        = "FilipeLABS"
 # environment         = "dev"
 # location            = "EastUS"
#}
