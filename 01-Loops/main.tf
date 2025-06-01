resource "null_resource" "looptest" {
  count = 2
}

output "looptest" {
    value = null_resource.looptest[*].id
  
}

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

resource "azurerm_virtual_machine" "test" {
  count                 =  length(var.nodes)
  name                  = "${var.nodes[count.index]}-test"
  location              = "UK West"
  resource_group_name   = "myfirstvm_group"
  network_interface_ids = ["/subscriptions/1c8859e3-276f-40f1-afc9-1dd8f8dc18d7/resourceGroups/myfirstvm_group/providers/Microsoft.Network/networkInterfaces/terraform-test"]
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