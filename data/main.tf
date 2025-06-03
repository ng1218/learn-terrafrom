data "azurerm_resource_group" "test" {
  name = "myfirstvm_group"
}

output "test" {
    value = data.azurerm_resource_group.test.id
  
}