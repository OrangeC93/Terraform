## Overview of State Modification
As your Terrafom usage becomes more advanced, there're some cases where you may need to modify the Terraform state. It is important to never modify the state file directly. Instead, make use of terraform state command. 

## List
```sh
terraform state list
aws_iam_user.lb
aws_instance.webapp
```

## Move
The terraform state mv command is used to move items in a Terraform state.
This command is used in many cases in which you want to rename an existing resource without destroying and recreating it. Due tot the destructive nature of this command, this command will output a backup copy of the state prior to saving any changes.
```sh
terraform state mv[options] SOURCE DESTINATION
```

## Pull
The terraform state pull command is used to manually download and output the state from remote state. This is useful for reading values out of state (potentially pairing this command with something lik jq)

## Push
The terraform state push command is used to manually upload a locak state file to remote state. This command should rarely be used. 

## Remove
The terraform state rm command is used to remove items from the Terraform state. Items removed from the Terraform state are not physically destroyed. Item removed from the Terraform state are only no longer managed by Terraform. For example, if you remove an AWS instance from the state, the AWS instance will continue running but terraform plan no longer see that instance. 

## Show
Show the attribute of a single resourdce in the Terraform state

## Example

```sh
provider "aws" {
  region     = "us-west-2"
    access_key = "YOUR-ACCESS-KEY"
    secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-082b5a644766e0e6f"
  instance_type = "t2.micro"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
}

terraform {
  backend "s3" {
    bucket = "kplabs-remote-backends"
    key    = "demo.tfstate"
    region = "us-east-1"
    access_key = "YOUR-ACCESS-KEY"
    secret_key = "YOUR-SECRET-KEY"
  }
}
```

### State Management Commands:

#### List the Resource with State File:
```sh
terraform state list
```
#### Rename Resource within Terraform State
1. Change the local name of EC2 resource from webapp to myec2. 
2. Run terraform plan to see the changes. It should destroy and recreate the EC2 instance.
3. Change the local name of EC2 within the terraform state file with following command:

```sh
terraform state mv aws_instance.myec2 aws_instance.webapp
```
#### Pull Current State file
```sh
terraform state pull
```
#### Remove Items from State file
```sh
terraform state rm aws_instance.myec2 
```
#### Show Attributes of Resource from state file
```sh
terraform state show aws_iam_user.lb
```

