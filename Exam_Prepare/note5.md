## Terrafrom Enterprise & Terrafrom Cloud
Terraform Enterprise provides added advantage compared to Terraform Cloud.

Som of these included:
- Single Sign-On
- Auditing
- Private Data Center Networking
- Clustering

Team & Governance features are not available for Terraform Cloud Free (Paid)

## Variables with undefined values
If you have variables with undefined values, it will not directly result in an error.

Terraform will ask you to supply the value associated with them.

Example Code:

variable custom_var {}

```terraform plan
var.custom_var
  enter a value:
```

## Environment Variables

Environment variables can be used to set variables. 

The environment variables must be in the format TF_VAR_name

```sh
export TF_VAR_region=us-west-1
export TF_VAR_ami=ami-049d8641
export TF_VAR_alist = '[1,2,3]'
```

## Structural Data Types
A structural type allows multiple values of serveral distinct types to be grouped together as a single value.

List contains multiple values of same type while object can contain multiple values of different type.

## BackEnd Configuration
Backends are configured directly in Terraform files in the terraform section.

After configuring a backends, it has to be initialized.

```sh
terraform {
  backend "s3" {
    bucket = "mybucket"
    key="path/to/my/key"
    region="us-east-1"
  }
}
```

## BackEnd Configuration Types-1
First Time Configuration:

When configuring a backend for the first time (moving from no defined backend to explicitly configuring one), Terraform give you the option to migrate your state to the new backend.

This lets you adopt backends without losing any existing state. 


## BackEnd Configuration Types -2
Partial Time Configuration:

You do not need to specify every required argument in the backend configuration

Omitting certain arguments may be desirable to avoid storing secrets, such as access keys, within the main configuration.

With a partial configuration, the remaining configuration arguments must be provided as part of the initialization process.

```sh
terraform {
  backedn "consul"
}

terraform init \
  - backend-config = "address=demo.consul.io" \
  - backend-config = "path=example_app/terraform_state" \
  - backend-config = "schema=https"
```

## Overview of Terraform Taint
The terraform taint command manually marks a Terraform-managed resources as tainted, forcing it to be destroyed and recreated on the next apply.

Once a resource is marked as tained, the next plan will show that the resource will be destroyed and recreated and the next apply will implement this change.


## Provisioner - Local
The local-exec provisioner invokes a local executable after a resource is created. This invoke a process on the machine running Terraform, not on the resource.

```sh
resource "aws_instance" "web" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.private_ip}" >> private_ips.txt
  }
  
 
```


## Provisioner - Remote
The remote-exect provisioner invokes a script on a remote resource after it's created.

The remote-exec provisioner supports both ssh and winrm type connections

```sh
resource "aws_instance" "web" {
  provisioner "remote-exec" {
    inline = [
      "yum -y install nginx"
      "yum -u install nano"
    ]
  }
}
```

## Provisioner - Failure Behavior
By default, provisioners that fail will also cause the Terraform apply itself to fail.

The on_failure setting can be used to change this. The allowed values are:
- continue: Ignore the error and continue with creation or destruction
- fail: raise an error and stop applying (the default behaviour). If this is a creation provitioner, taint the resource. 

```sh
resource "aws_instance" "web" {

  provisioner "local-exec"{
    command = "echo The server's IP address is ${self.private_ip}"
    on_failure = continue
  }
}
```

## Provisioner Types
There're two primary types of provisioners:
- Creation-Time Provisioner: Creation-Time provisioners are only run during creation, not during updating or any other lifecycle. If a creation-time provisioner fails, the resource is marked as tainted. 
- Destroy-Time Provisioner: Destroy provisioners are run before the resource is destroyed. 


## Input Variables
The value associated with a variable can be assigned via multiple approaches.
```
variable "image_id" {
  type = string
}
```
Value associated with the variable can be defined via CLI as well as in tfvars file. 

Following is syntax to load custom tfvars file:

terraform apply -var-file="testing.tfvars"

## Variable Definition Procedence
Terraform loads variable in the following order, with later sources taking precedence over earlier ones:
- Environment variables
- The terraform.tfvars file, if present
- The terraform.tfvars.json file, if present
- Any *.auto.tfvars or* .auto.tfvars.json files, processed in lexical order of their filenames.
- Any -var and -var-file options on the command line, in the order they are provided

If the same variable is assigned multiple values, Terraform uses the last value it finds

## Terraform Local Backend
The local backend stores state on teh local file system, locks that state using system APIs, and performs operations locally. 
By default, Terraform uses the "local" backend, which is the normal behavior of Terraform you're used to 

```sh
terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}
```

## Required Providers
Each Terraform module must declare which provider it requires, so that Terrafrom can install and use them.

Provider requiremnts are declared in a required_provider block.


```sh
terraform {
  required_providers {
    mycloud = {
      source = "mycorp/mycloud"
      version = "~> 1.0"
    }
  }
}
```

## Required Version
The required_version setting accepts a version constraint string, which specifies which versions of Terraform can be used with your configuration.

If the running version of Terraform doesn't match the constraints specified, Terraform will produce an error and exit without taking any futher actions. 

```sh
terraform{
  required_version = "> 0.12.0"
}
```

## Versioning Arguments
There're multiple ways for specifying the version of a provider.
- >=1.0: greater than equal to the version
- <=1.0: less than equal to the version
- ~>2.0: any version in 2.X range
- >=2.10, <=2.30: any version between 2.10 and 2.30
