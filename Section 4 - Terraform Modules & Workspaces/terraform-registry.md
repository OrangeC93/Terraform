## Overview of Terraform Registry
The Terraform Registry is a repository of modules written by the Terraform community

The registry can help you get started with Terraform more quickly

## Verified Modules in Terraform Registry
Within Terraform Registry, you can find verifed modlues are maninted by various third party vendors. These modules are available for various resources like AWS VPC, RDS, ELB and others. 

Verified modules are reviewed by HashiCorp and actively maintained by contributors to stay up to date and compatible with both Terraform and their respective providers. The blue verification badge appears next to module that are verified. Module verification is currently a manual process restricted to a small group of trusted HashiCorp partners.

## Using Registry Module in Terraform
To use Terraform Registry module within the code, we can make use of the source argument that contains the module path.
Below code reference to EC2 Instance module whithin terraform registry.

```sh
module "ec2-instance" {
  source = "terraform-aws-modules/ec2-instance/aws"
}
```

### Terraform Registry URL:

https://registry.terraform.io/

### Demo Code used in Video:

```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 1

  ami                    = "ami-0d6621c01e8c2de2c"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-4dbfb206"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```
