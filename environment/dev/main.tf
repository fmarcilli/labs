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

module "vm"{
  source = "../../modules/marcilli"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = "EastUS"
     
}

module "vnet"{
  source = "../../modules/vnet"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = "EastUS"
}

#module "internal"{
#  source = "../../modules/vnet"
#  project_name        = "FilipeLABS"
#  environment         = "dev"
#  location            = "EastUS"
#}

#module "net-int"{
#  source = "../../modules/vnet"
#  project_name        = "FilipeLABS"
#  environment         = "dev"
#  location            = "EastUS"
#}
