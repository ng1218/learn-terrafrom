provider "vault" {
 address = "http://vault.nareshdevops1218.online:8200"
 token   = var.token
}

variable "token" {}

data "vault_generic_secret" "secret" {
  path = "demo/ssh"
}

resource "local_file" "foo" {
  content  = jsonencode(data.vault_generic_secret.secret.data["password"])
  filename = "tmp/vault"
}

output "secret" {
    value = data.vault_generic_secret.secret.data["username"]
    sensitive = true
}
