resource "null_resource" "test" {
  
}

output "test" {
  value = length(null_resource.test) > 0 ? "Resources are more than 0" : "Resources are less than 0"
}