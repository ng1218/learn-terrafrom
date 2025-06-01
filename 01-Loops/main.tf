resource "null_resource" "looptest" {
  count = 10
}

output "looptest" {
    value = null_resource.looptest[*].id
  
}