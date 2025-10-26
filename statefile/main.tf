terraform {
  backend "azurerm" {
    resource_group_name  = "myfirstvm_group"
    storage_account_name = "nareshdevops"
    container_name       = "roboshopcontainer"
    key                  = "dev-terraform.tfstate"
  }
}