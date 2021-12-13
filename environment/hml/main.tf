terraform {
    
    backend "azurerm" {
    resource_group_name  = "RG-Terraform"
    storage_account_name = "terraformmarcilli"
    container_name       = "envi-lab"
    key                  = "hml-terraform.tfstate"
    }
  }

provider "azurerm" {
    features {}
 }

#teste1

# # Resource Group Module
# # module "resource_group_lab"{
# #   source = "../../modules/resource-group"
# #   project_name        = "FilipeLABS"
# #   environment         = "hml"
# #   location            = "EastUS"
   
# # }

# # Storage Account Module
# module "storage_account_lab"{
#   source = "../../modules/storage-account"
#   project_name        = "filipelabs"
#   environment         = "hml"
#   location            = module.resource_group_lab.location
#   rg_name             = module.resource_group_lab.name

    
# }

#VNET Module
# module "vnet_lab"{
#   source = "../../modules/vnet"
#   project_name        = "FilipeLABS"
#   environment         = "hml"
#   location            = module.resource_group_lab.location
#   rg_name             = module.resource_group_lab.name
#   vnet_name           = "vnetlab"
#   address_space       = ["10.0.0.0/16"]
#   address_prefixes    = ["10.0.2.0/24"]
  
#   }
  
# # VM Module Windows
# module "vm_windows"{
#   source = "../../modules/vm-windows"
#   project_name        = "FLABS"
#   environment         = "hml"
#   location            = module.resource_group_lab.location
#   rg_name             = module.resource_group_lab.name
#   subnet_id           = module.vnet_lab.subnet_id
   
# }

# ## VM Module Linux
# # module "vm_lab"{
# #   source = "../../modules/VM"
# #   project_name        = "FilipeLABS"
# #   environment         = "hml"
# #   location            = module.resource_group_lab.location
# #   rg_name             = module.resource_group_lab.name
# #   subnet_id           = module.vnet_lab.subnet_id
   
# # }

# NSG Module 
# module "nsg-lab" {
#   source = "../../modules/nsg"
#   project_name        = "FilipeLABS"
#   environment         = "hml"
#   location            = module.resource_group_lab.location
#   rg_name             = module.resource_group_lab.name
#   vnet_name           = "vnetlab"
#   address_space       = ["10.0.0.0/16"]
#   address_prefixes    = ["10.0.2.0/24"]
#   subnet_id           = module.vnet_lab.subnet_id
 
    
#  }



# Service Plan Module
# module "azurerm_app_service_plan"{
#   source = "../../modules/service-app"
#   project_name        = "FilipeLABS"
#   environment         = "hml"
#   location            = module.resource_group.location
#   rg_name             = module.resource_group.name
    
# }

# Service App Module
# module "azurerm_app_service"{
#   source = "../../modules/service-app"
#   project_name        = "FilipeLABS"
#   environment         = "hmldev"
#   location            = module.resource_group.location
#   rg_name             = module.resource_group.name
  
   
# }