## Overview of the Sentinel
Sentinel is a policy-as-code freamework integrated with the HashiCorp Enterprise products. It enables fine-grained, logic-based policy decisions and can be extended to use information from external sources. 

Note: Sentinel policies are paid features

terraform plan -> sentinel checks -> terraform apply

## Documentation Referred:

https://www.terraform.io/cloud-docs/sentinel/examples

### Sentinel Policy

```sh
import "tfplan"

main = rule {
  all tfplan.resources.aws_instance as _, instances {
    all instances as _, r {
      (length(r.applied.tags) else 0) > 0
    }
  }
}
```

### EC2 Instance with Tags Code:

```sh
provider "aws" {
  region     = "us-west-2"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"

   tags = {
    Name = "HelloWorld"
  }  
}
```
