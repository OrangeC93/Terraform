## Overview of Condition Expression
A conditional expression uses the value of a bool expression to select one of two values.Syntax of Conditional expression: condition ? true_val :  false_val. If condition is true then result is true_val. 

Below example: depending on the variable value, one of the resource blocks will run -> dev purpose or prod purpose

## This snippet is from the Conditional Expression Video.

### conditional.tf

```sh

provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

variable "istest" {}

resource "aws_instance" "dev" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0 
}

resource "aws_instance" "prod" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0 
}
```

### terraform.tfvars

```sh
istest = false # prod instances will be created if istest=false else dev instance will be created
```
