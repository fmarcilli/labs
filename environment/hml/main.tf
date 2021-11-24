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
  environment         = "hml"
  location            = "EastUS"
}