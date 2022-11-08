## Terraform Graph
The terraform graph command is used to generate a visual representation of either a configuration or execution plan.

The output of terraform graph is in the DOT format, which can easily be converted to an image. 

## Splat Expressions
Splat Expression allow us to get a list of all the attributes

```sh
resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}
```

## Terraform Technologies
- aws_instanc: Resource Type
- example: Local name for the resource
- ami: Argument Name
- abc123: Argument value

## Provider Configuration
Provider Configuration block is not mandatory for all the terrafrom configuration
```sh
provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = 
}

resource "aws_iam_user" "iam" {
  name = "iamuser"
  path = '/system/'
}
```
## Terrafrom Output
The terrafrom output command is used to extract the value of an output variable from the state file. 
```sh
terraform output iam_names
```

## Terraform Unlock
If supported by your backend, Terraform will lock your state for all operations that could write state.

Not all backends supports locking functionality.

Terraform has a force-unlock command to manually unlok the state if unlocking failed.

terraform force-unlock LOCK_ID(DIR)


## Miscellaneous Pointers
There're three primary benefits of Infrastructures as Code tools:

Automation, Versioning, and Reusability.

Various IAC Tools Available in the market:
- Terraform
- CloudFormation
- Azure Resource Manager
- Google Cloud Deployment Manager

Sentinel is a proative service

Terraform Refresh does not modify the infrastructure but it modifies the state files. 

Slice Function is not part of the string function. Other like join, split, chomp are part of it.

It's not mandatoary to include the module version argument while pulling the code from terraform registry.

Overuser of dynamic blocks can make configuration hard to read and maintain

Terraform Apply can change, destroy and provision resources but cannot import any resource. 

