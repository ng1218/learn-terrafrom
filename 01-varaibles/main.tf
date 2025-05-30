variable "test" {
    default = 100
  
}

output "test1" {
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