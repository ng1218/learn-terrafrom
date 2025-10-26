terraform {
  backend "azurerm" {
    resource_group_name  = "myfirstvm_group"
    storage_account_name = "nareshdevops"
    container_name       = "roboshopcontainer"
    key                  = "dev-terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1c8859e3-276f-40f1-afc9-1dd8f8dc18d7"
}