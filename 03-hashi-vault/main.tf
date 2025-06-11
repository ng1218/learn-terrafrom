provider "vault" {
 address = "https://vault.nareshdevops1218.online:8200"
}

data "vault_generic_secret" "secret" {
  path = "secret/demo/ssh"
}

resource "local_file" "foo" {
  content  = data.vault_generic_secret.secret
  filename = "tmp/vault-secrets"
}

