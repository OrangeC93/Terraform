## Terraform Providers - Part1
A provider is responsible for understanding API interactions and exposing resources.

Most of the available providers correspond to one cloud or on-premises infrastructure platform, and offer resource types that correspond to each of the features of that platform.

You can explicitly set a specific version of the provider within the provider block.

To upgrade to the latest acceptable version of each provider, run terraform init -upgrade.

## Provider Architecture
do_droplet.tf -> terraform -> digital ocean provider -> infrastructure provisioning -> digital ocean

## Terraform Provider - Part2
You can have multiple provider instance with the help of alias
```sh
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias = "west"
  region = "us-west-2"
}
```
The provider block without alias set is known as the default provider configuration. When an alias is set, it creates an additional provider configuration. 


## Terraform Init
The terraform init command is used to initialized a working directory containing Terraform configuration files. 

During init, the configuration is searched for module blocks, and the source code for referenced modules is retrieved from the locations given in their source arguments.

Terraform must initialize the provider before it can be used.

Initialization downloads and installs the provider's plugin so that it can later be execuated.

It will not create any sample files like example.tf.


## Terraform Plan
The terraform plan command is used to create an execution plan. It will not modify things in in frastructure. 

Terraform performs a refresh, unless explicitly disabled, and then determines what actions are necessary to achieve the desired state specified in the configuraion files. 

This command is a convenient way to check whether the execution plan for a set of changes matches your expectations without making any changes to real resources or to the state. 


## Terraform Apply
The terraform apply command is used to apply the changes required to reach the desired state of the configuration.

Terraform apply will also write data to the terraform.tfstate files.

Once apply is completed, resources are immediately available. 

## Terraform Refresh
The terraform refresh command is used to reconfile the state Terraform knows about (via its state file) with the real-world infrastructure.

This does not modify infrastructure but does modify the state files. 

## Terraform Destroy
The terraform destroy command is used to destroy the Terraform-managed infrastructure. 

Terraform destroy command is not the only commmand through which infrastructure cna be destroyed. 

## Terraform Format
The terraform fmt command is used to rewrite Terraform configuration files to a canonical format and style.

For use-case, where the all configuration written by team member needs to have a proper style of code, terraform fmt can be used. 


## Terraform Validate
The terraform validate command validates the configuration files in a directory.

Validate runs checks that verify whether a configuration is syntactically valid and thus primarily useful for general verification of reuseable modules, including the correctness of attribute names and value types.

It's safe to run this comman auto, for example, as a post-save check in a text editor or as a test step for a reusable modle in a CI system. It can run before terraform plan. 

Validation requires an initialized working directory with any referenced plugins and modules installed. 


## Terraform Provisioners
Provisioners can be used to model specific actions on the local machine or on a remote machine in order to prepare servers or other infrastructure objects for service. 

Provisioners should only be used as a last resort. For most common situations, there're better alternatives. 
- Provisioners are inside the resource block.
- Have an overview of local and remote provisioner




