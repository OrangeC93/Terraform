## Overview of Local Values
A local value assigns a name to an expression, allowing it to be used multiple times within a modlue without repeating it. 

## Local Values Support for Expression
Local Values can be used for multiple different use-cases like having a conditional expression
```sh
locals {
  name_prefix = "${var.name ! = "" ? var.name : var.default}"
}
```

## This snippet is from the Local Values video.

### local-values.tf

```sh
provider "aws" {
  region     = "ap-southeast-1"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

locals {
  common_tags = {
    Owner = "DevOps Team"
    service = "backend"
  }
}
resource "aws_instance" "app-dev" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   tags = local.common_tags
}

resource "aws_instance" "db-dev" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.small"
   tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "us-west-2a"
  size              = 8
  tags = local.common_tags
}
```
