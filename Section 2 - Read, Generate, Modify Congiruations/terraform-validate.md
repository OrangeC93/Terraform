##  Overview of Terraform Validate
Terraform Validate primarily checks whether a configuration is syntactically valid. It can check various aspects including un supported arguments, underclared variables and others.
```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-082b5a644766e0e6f"
  instance_type = var.instancetype
  sky = "blue"
}
```

### Command for Validating

```sh
terraform validate
```
