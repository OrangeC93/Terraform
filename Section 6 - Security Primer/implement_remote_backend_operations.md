## remote-backend.tf
```
terraform {
  cloud {
    organization = "mykplabs-org"
    
    workspaces {
      name = "remote-operation"
    }
  }
}
```

## iam.tf
```
provider "aws" {
  region = "us-west-2"
  access_key = ""
  secret_key = ""
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
}
```

```sh
terraform login
terraform init
terraform plan
```
