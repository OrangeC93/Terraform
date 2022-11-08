## Terraform Functions
The Terraform language includes a number of built-in functions that you can use to transform and combine values.
- max(5,12,9)->12

The Terraform language does not support user-defined functions, and so only the functions built into the language are available for use.

Be aware of basic functions like element, lookup

## Count and Count Index
The count parameter on resources can simplify configurations and let you scale resources by simply incrementing a number.

In resource blocks where the count is set, an additional count object (count.index) is available in expression, so that you can modify the configuration of each instance. 

```sh
resource "aws_iam_user" "lb" {
  name = "loadbalancer.${count.index}"
  count = 5
  path = "/system"
}
```

## Find the Issue - Use Case
You can expect use-case with terrafrom code, and you have to find what should be removed as part of Terraform best practice.

```sh
terraform {
  backend "s3" {
    bucket = "mybucket"
    key = "path/to/my/key"
    region 'us-east-1'
    access_key = 1234
    secret_key = 12345678909
  }
}
```

## Terraform Lock
If supported by your backedn, Terraform will lock your state for all operations that could write state.

Terraform has a force-unlock command to manually unloack the state if unlocking failed. 

## Use-Case - Resources Deleted Out of Terraform
You have created an EC2 instance. Someone has modified the EC2 instance manually. What will happen if you do terraform plan yet again?

1. someone has changed EC2 instance type from t2 micro to t2 large
2. someone has terminated the EC2 instance

Answer1: terraform current sate will have t2.large, and the desired sate is t2.micro, it will try the change back intance type to t2.micro

Answer2: terraform will create a new EC2 instance


## Resource Block
Each resource block describes one or more infrastructure objects, such as vitual networks, compute instances, or higher-level components such as DNS records. 

A resource block declares a resource of a given type "aws_instance" with a given local name "web"

```sh
resource "aws_instance" "web" {
  ami = "ami_alb2c3d4"
  instance_type="t2.micro"
}
```
## Sentinel
Sentinel is an embedded policy-as-code framework integrated with the HashiCorp Enterpreise products.

Can be used for various use-cases like:
- Verify if EC2 instance has tages
- Verify if the S3 bucket has encryption enabled

## Sensitive Data in State File
If you manage any sensitive data with Terraform (like database passwords, user passwords, or private keys), treat the state itself as sensitive data. 

Approches in such a scenario:

Terraform Cloud alwasy encrypts the state at rest and protects it with TLS in transit. Terraform Cloud also knows the identity of the user requesting state and maintains a history of stae changes.

The S3 backend supports encryption at rest when the encrypt option is enabled.

## Dealing with Credentials in Config
Hard-coding credential into any Terraform configuration are not recommended, and risks the secret leakage should this file ever be commited to a public version control system.

You can store the credentials outside of terraform configuration.

Storing credentials as part of environment variable is also a much better approach than hard cording it in the system. 

## Remote Backends
The remote backend stores Terraform state and may be used to run operations in Terraform Cloud.

When using full remote operations, operations like terraform apply can be executed in Terraform Cloud's run environment, with log output streaming to the local terminal. 

## Miscellaneous Pointers
Terraform does not require go as a prerequisite.

It works well in Windows, Linux, Mac.

Windows Server is not mandatory.
