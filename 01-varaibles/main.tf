variable "test" {
    default = 100
  
}

output "test" {
  value = var.test
}

# Variable data types

variable "datatypes" {
  default = [
    1,
    2,
    "test",
    true
  ]

}

output "datatypes" {
  value = var.datatypes[1]
}

variable "datatypes1" {
  default = {
    x = 10
    y = 20
    z = "test"
  }
  
}

output "datatypes1" {
  value = var.datatypes1["z"]
}


## Variable from command line

variable "cli" {
  
}

output "command-line" {
  value = var.cli
}

##Variable from terraform.tfvars
##terraform apply -auto-approve -var.file=env.tfvar
variable "terraformtfvards" {}

output "TestTerraformVars" {
  value = var.terraformtfvards
}

## Varaibles from file
variable "terraformvarfromfile" {}

output "TestTerraformVars" {
  value = var.terraformvarfromfile
}

##{file-name}-auto.tfvars
variable "autoapprovevars" {}

output "Test Terraform Vars" {
  value = var.autoapprovevars
}