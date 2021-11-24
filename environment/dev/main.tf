terraform {
    #backend "azurerm" {}

}

provider "azurerm" {
    features {}
 }


# Resource Group Module

module "resource_group"{
  source = "../../modules/marcilli"
  project_name        = "FilipeLABS-v.1.3"
  environment         = "dev"
  location            = "EastUS"
}