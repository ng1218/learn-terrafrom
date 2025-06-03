resource "null_resource" "name" {
  
}

terraform {
  backend "azurerm" {
    use_msi              = true                                    # Can also be set via `ARM_USE_MSI` environment variable.
    tenant_id            = "00000000-0000-0000-0000-000000000000"  # Can also be set via `ARM_TENANT_ID` environment variable.
    subscription_id      = "1c8859e3-276f-40f1-afc9-1dd8f8dc18d7"  # Can also be set via `ARM_SUBSCRIPTION_ID` environment variable.
    resource_group_name  = "myfirstvm_group"
    storage_account_name = "nareshdevops"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "roboshop-state-files"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "test.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}