## Dynamic Secrets
[Vault](https://www.vaultproject.io/)

## Vault Provider
Valt provider allows Terraform to read from, write to and configure HashiCorp Vault.


```sh
provider "vault" {
  address = "http://127.0.0.1:8200"
}

data "vault_generic_secret" "demo" {
  path = "secret/db-creds"
}
```

