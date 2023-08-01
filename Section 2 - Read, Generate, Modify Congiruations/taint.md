## Terraform taint
You have created a new resources via Terraform. Users have made a lot of manual changes (both infrastructure and inside the server). Two ways to deal with this: Import the Changes to Terraform/Delete&Recreate the resource

## Overview of Terraform Taint
The terraform taint command manually marks a Terraform-managed resources as a tainted, forcing it to be destroyed and recreated on the next apply

## Important Pointers
This command will not modify infrastructure, but does modify the state file in order to mark a resoruce as tainted. Once resource is mared as tained, the next plan will show that the resource will be desctroyed and recreated and the next apply will implment this change. Note that tainting a resource for recreation may affect resources that depend on the newly taint resource.
### taint.tf
```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}
```

### Taint Command
```sh
terraform taint aws_instance.myec2
```
