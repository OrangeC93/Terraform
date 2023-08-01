## Understanding Semantics
Terraform generally loads all the configuration files within the directory specified in alphabetical order. The files loaded must end in either .tf or .tf.json to specify the format that is in use.
- terraform-kplabs: web.tf, app.tf, sg.tf, providers.tf

### ec2.tf

```sh
resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}

resource "aws_instance" "newec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}
```

### iam_user.tf

```sh
resource "aws_iam_user" "lb" {
  name = var.iam_user
  path = "/system/"
}
```

### provider.tf

```sh 
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}
```

### variables.tf

```sh
variable "iam_user" {
  default = "demouser"
}
```

### semantics.tf

```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

variable "iam_user" {
  default = "demouser"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}

resource "aws_iam_user" "lb" {
  name = var.iam_user
  path = "/system/"
}
```
