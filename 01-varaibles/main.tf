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
variable "env" {}

output "env" {
  value = var.env
}

## Varaibles from file
variable "v1" {}

output "v1" {
  value = var.v1
}

##{file-name}-auto.tfvars
variable "server-count" {}

output "server-count" {
  value = var.server-count
}