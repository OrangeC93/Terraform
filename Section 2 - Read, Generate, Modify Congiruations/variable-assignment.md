### Multiple Approaches to Variable Assignment

Variables in Terraform can be assigned values in multiple ways
- Environment variables
- Command Line Flag
- From a File
- Variable Defaults

Declaration vs Assignment
- A variables.tf file is used to define the variables type and optionally set a default value.
- A terraform.tfvars file is used to set the actual values of the variables.
- You could set default values for all your variables and not use tfvars files at all.

### Default File used in Demo

```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = var.instancetype
}
```
### variables.tf
```sh
variable "instancetype" {
  default = "t2.micro"
}
```
### custom.tfvars
```sh
instancetype="t2.large"
```

### terraform.tfvars
```sh
instancetype="t2.large"
```

### CLI Commands

```sh
terraform plan -var="instancetype=t2.small"
terraform plan -var-file="custom.tfvars"
```

### Environment Variables:

### Windows Approach:
```sh
setx TF_VAR_instancetype t2.large
``` 
### Linux / MAC Approach
```sh
export TF_VAR_instancetype="t2.nano"
echo $TF_VAR
```
