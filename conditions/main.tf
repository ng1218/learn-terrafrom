variable "nodes" {
    default = {
      "test1" = {
        private_ip_address_allocation = "Dynamic"
      }
      "test2" = {}
    }
}

provider "azurerm" {
  features {}
  subscription_id = "1c8859e3-276f-40f1-afc9-1dd8f8dc18d7"
}

resource "azurerm_network_interface" "privateip" {
  for_each            = var.nodes
  name                = "${each.key}.ip"
  location            = "UK West"
  resource_group_name = "myfirstvm_group"

  ip_configuration {
    name                          = "${each.key}-ip"
    subnet_id                     = "/subscriptions/1c8859e3-276f-40f1-afc9-1dd8f8dc18d7/resourceGroups/myfirstvm_group/providers/Microsoft.Network/virtualNetworks/myfirstvm-vnet/subnets/default"
    private_ip_address_allocation = length(each.value["private_ip_address_allocation"]) > 0 ? each.value["private_ip_address_allocation"] : ""
  }
}