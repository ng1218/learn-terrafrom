variable "x" {
  default = 10
}

variable "stringTest" {
  default = "test string variable"
}

variable "ListTest" {
  default = {
    x = 10
    y = "Test"
    z = true
  }
}

output "test1" {
  value = var.stringTest
}

output "printList" {
  value = var.ListTest["y"]
}

variable "cli" {}

output "command-line" {
  value = var.cli
}

//Variable from file
variable "env" {}

output "env" {
  value = var.env
}

//Default Variables
variable "server-count" {}

output "server-count" {
  value = var.server-count
}
