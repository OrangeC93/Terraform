## Fetching Values from Map
To reference to image-abc from the below map, following approaches needs to be used: var.ami_ids['mumbai']
```sh
variable "ami_ids" {
  type = "map"
  default = {
    "mumbai" = "image-abc"
    "germany" = "image-def"
    "states" = "image-xyz"
  }
}
```

## Terraform and GIT - Part 1
If you're making use of GIT repository for commiting terraform code, the .gitigore should be configured to ignore certain terraform files that might contain sensitive data. Some of these can include:
- terraform .tfstate file (this can include sensitive information)
- *.tfvars (may contain sensitive data like passwords)

## Terraform and GIT - Part 2
Arbitrary Git repositories can be used by prefixing the address with the special git:: prefix.

After this prefix, any valid Git URL can be specified to select one of the protocals supported by Git.

```sh
module "vpc" {
  source = "git::https://example.com/vpc.git"
}

module "storage" {
  source = "git::ssh://username@example.com/storage.git"
}
```

## Terraform and GIT - Part 3
By default, Terraform will clone and use the default branch (referenced by HEAD) in the selected repository.

You can override this using the ref argument:

```sh
module "vpc" {
  source = "git::https://example.com/vpc.git?ref=v1.2.0"
}

The value of the ref argument can be any reference that would be accepted by the git checkout command, including branch and tag names. 
```

## Terraform Workspace
- Workspaces are managed with the terraform workspace set of commands.
- State File Directory = terraform.tfstate.d
- Not suitable for isolation for storage separation between workspace (stage/prod)
- User cases
  - Create New Workspace:terraform workspace new kplabs
  - Switch to a specific Workspace: terraform workspace select prod

## Dependency Types - Implicit
With implicit dependency, Terraform can automatically find references of the object, and create an impact ordering requirement between the two resources. 

```sh
resource "aws_eip" "my_eip" {
  vpc = "true"
}

resource "aws_instance" "my_ec2" {
  instance_type = "t2.micro"
  public_ip = "aws_eip.myeip.private_ip"
}
```

## Dependency Types - Explicit
Explicitly specifying a dependency is only neccessary when a resource relies on some other resource's behavior but doesn't access any of that resource's data in its argument
```sh
resource "aws_s3_bucket" "example"{
  acl = "prevate"
}

resource "aws_instance" "myec2" {
  instance_type = "t2.micro"
  depends_on = [aws_s3_bucket.example]
}
```

## Data Source Code
- Data source allow data to be fetched or computed fro use elsewhere in Terraform configuration.
- Reads from a specific data source (aws_ami) and exports results under "app_ami"

```sh
data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]
  
  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


## can be used 
resource "aws_instance" "instance-1" {
  ami = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}
```
## Terraform taint
Terraform Taint can also be used to taint resource within a module.
terraform taint [options] address

```sh
terraform taint "module.couchbase.aws_instance.cb_node[9]"
```

For multiple sub modules, following syntax-based example can be used

module.foo.module.bar.aws_instance.qux

## Terraform Module Source
The module installer supports installation from a number of different source types like Local paths, Terrafrom Registry, GitHub, S3 bucket and others.

Local path reference allow for factoring out portions of a configutraion within a single source repository.

A local path must begin with either ./ or ../ to indicate that a local path is intended.

```sh
module "consul" {
  source = "../consul"
}
```

## Dealing with Larger Infrastructure
Cloud Provider has certain amount of rate limiting set to Terraform can only request certain amount of resources over a period of time.

It's important to break larger configurations into multiple smaller configutraions that can be independently applied

Alternatively, you can make use of -refresh=false and target flag for a workaround (not recommendated)

## Miscellaneous Pointers
lookup retrieves the value of a single element from a map: lookup(map, key, default)

Various commands runs terraform refresh implicitly, some of these include: terraform[plan, apply, destroy]

Others like terrafrom [init, import] do not run refresh implictly

Array Datatype is not supported in Terraform

## Miscellaneous Pointers -2
Various variable definition files will be loaded automaticlly in terraform. These include:
- terraform.tfvars
- terraform.tfvars.json
- Any files with name ending in .auto.tfvars.json

Both implicit and explicit dependency information is stored in terraform.tfstate file.

terraform init - upgrade updates all prevously installed plugins to the newest version


## Miscellaneous Pointers -3
The terraform console command providers an interactive console for evaluating expressions. 

Difference 0.11 and 0.12
- "${var.instance_type}" -> 0.11
- var.instance_type -> 0.12
