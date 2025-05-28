# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_virtual_machine" "frontend-test" {
  name                  = "frontend-test"
  location              = "UK West"
  resource_group_name   = "myfirstvm_group"
  network_interface_ids = ["/subscriptions/1c8859e3-276f-40f1-afc9-1dd8f8dc18d7/resourceGroups/myfirstvm_group/providers/Microsoft.Network/networkInterfaces/terraform-test"]
  vm_size               = "Standard_D2ls_v5"

  delete_os_disk_on_termination = true

  storage_image_reference {
   id = "/subscriptions/1c8859e3-276f-40f1-afc9-1dd8f8dc18d7/resourceGroups/myfirstvm_group/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "frontend-test-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "frontend-test"
    admin_username = "azuser"
    admin_password = "devops@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}