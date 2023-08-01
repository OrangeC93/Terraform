## Overview of Debugging Terraform
Terraform has detailed logs that can be enabled by setting the TF_LOG environment variable to any value. 

You can set TF_LOG to one of the log levels TRACE, DEBUG, INFO, WARN or ERROR to change the verbosity of the logs. 

Example: TF_LOG=TRACE

TO persist logged output, you can set TF_LOG_PATH

## Terraform Import
Terraform is able to import existing infrastructure. 

This allows you take resources that you've created by some other means and bring it under Terraform management.

The current implementation of Terraform import can only import resources into the state. It does not generate configurations. 

Because of this, prior to running terraform import, it's necessary to write resource configuration block manually for the resource, to which the imported object will be mapped.

terraform import aws_instance.myec2instance-id

## Local Values
A local value assigns a name to an expression, allowing it to be used multiple times within a module without repeating it. 

The expression of a local value can refer to other locals, but as usual reference cycles are not allowed. That's a local cannot refre to itself or to a variable that refers (directly or indirectly) back to it. 

It's recommended to group together logically-related local values into a single block, particularly if they depend on each other. 


## Overview of Data Types
String, list, map, number

## Terraform WorkSpace
Terraform allow us to have multiple workspaces, with each of the workspaces, we can have a different set of environment variables associataed.

Workspaces allow multiple state files of a single configuration.

## Terraform Modules
We can centralize the terraform resources and can call out from TF files whenever required.


## Terraform Modules - ROOT and Child
Every Terraform configuration has at least one module, known as its root module, which consists of the resources defined in the .tf files in the main working directory.

A module can call other modueles, which lets you include the child moduel's resources into the configuration in a concise way.

A module that includes a module black like this is the calling module of the child module. 


## Module - Accessing Output Values
The resources defined in a module are encapulated, so the calling module cannot access their attributes directly. However, the child module can declare output values to selectively export certain values to be accessed by the calling module.


## Suppressing Value in CLI Output
An output can be marked as containing sensitive material using the optinal sensitive argument:

Setting an output value in the root module as sensitive prevents Terraform from showing its value in the list of outputs at the end of terraform apply

Sensitive output values are still recorded in the state, and so will be visible to anyone who is able to access the state data. 

## Module Versions
It's recommanded to explicitly constraint the acceptable version numbers for each external module to avoid unexpected or unwanted changes.

Version constraints are supported only for modules installed from a module registry, such as the Terraform Registry or Terraform Cloud private module registry

## Terraform Registry
The Terraform Registry is integrated directly into Terraform. 

The syntax for refereing a registry module is 
<NAMESPACE>/<NAME>/<PROVIDER>
  
For example: hashicorp/consul/aws.

```sh
module "consul" {
  source = "hashicorp/consul/aws"
  version = "0.1.0"
}  
```
## Private Registry for Module Sources
You can also use modules from a private registry, like the one provided by Terraform Cloud.

Private registry modules have source strings of the following form:
<HOSTNAME>/<NAMESPACE>/<NAME_PROVIDER>

This the same format as the public registry, but with an added hostname prefix.
  
While fetching a module, having a version is required.

```sh
module "vpc" {
  source = "app.terraform.io/example_corp/vpc/aws"
  version = "0.9.3"
}  
```
  
