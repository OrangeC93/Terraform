## Terraform Cloud - Backend Operation Types
The remote backend stores Terraform state and may be used to run operations in Terraform Cloud. Terraform Cloud can also be used with local operations, in which case only state is stored in the Terraform Cloud backend.

## Remote Operation
When using full remote operations, operations like terraform plan or terraform apply can be executed in Terraform Cloud's run enviromnet, with log output streaming to the local terminal . 



## iam.tf
```sh
terraform {
  required_version = "~> 0.12.0"
  
  backend "remote" {}
}

resource "aws_iam_user" "lb" {
  name = "remoteuser"
  path = "/system/"
}
```

## backend.hcl
```sh
workspace {name = "demo-repository"}
hostname = "app.terraform.io"
organization = "demo-kplabs-org"
```
