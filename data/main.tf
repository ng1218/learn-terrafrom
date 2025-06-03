provider "azurerm" {
  features {}
  subscription_id = "1c8859e3-276f-40f1-afc9-1dd8f8dc18d7"
}

data "azurerm_resource_group" "test" {
  name = "myfirstvm_group"
}

output "test" {
    value = data.azurerm_resource_group.test.id
  
}