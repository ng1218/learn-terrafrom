provider "vault" {
 address = "https://vault.nareshdevops1218.online:8200"
 token   = var.token
}

variable "token" {}

data "vault_generic_secret" "secret" {
  path = "secret/demo/ssh"
}

resource "local_file" "foo" {
  content  = data.vault_generic_secret.secret.data
  filename = "tmp/vault-secrets"
}

