variable "nodes" {
    default = [
        "test1",
        "test2"
    ]
}


provider "azurerm" {
  features {}
  subscription_id = "1c8859e3-276f-40f1-afc9-1dd8f8dc18d7"
}

resource "azurerm_network_interface" "privateip" {
  count               = length(var.nodes)
  name                = "${var.nodes[count.index]}-ip"
  location            = "UK West"
  resource_group_name = "myfirstvm_group"

  ip_configuration {
    name                          = "${var.nodes[count.index]}-ip"
    subnet_id                     = "/subscriptions/1c8859e3-276f-40f1-afc9-1dd8f8dc18d7/resourceGroups/myfirstvm_group/providers/Microsoft.Network/virtualNetworks/myfirstvm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "test" {
  count                 =  length(var.nodes)
  name                  = "${var.nodes[count.index]}-vm"
  location              = "UK West"
  resource_group_name   = "myfirstvm_group"
  network_interface_ids = [azurerm_network_interface.privateip[count.index].id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
   id = "/subscriptions/1c8859e3-276f-40f1-afc9-1dd8f8dc18d7/resourceGroups/myfirstvm_group/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "${var.nodes[count.index]}-test-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.nodes[count.index]}-test"
    admin_username = "azuser"
    admin_password = "devops@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}