## Overview of Count Parameter
The count parameter on resources can simplify configurations and let you scale resrouces by simply incrementing a number. Let assume, you need to create two EC2 instances. One of the common approach is to define two seperate resource blocks fro aws_instance. Below code, terraform will create 5 IAM  users. But the probalem is all will have the same name.

```sh
resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  count = 5
  path = '/system/'
}
```

## Count Index
In resource blocks where count is et, an additional count object is available in expressions, so you can modify the configuration of each instance.

count.index = the distinct index number starting with 0 corresponding to this instance, allows us to fetech the index of each iteration in the loop, below example: loadbalancer.0, loadbalancer.1, loadbalancer.2 ... 

```sh
resource "aws_iam_user" "lb" {
  name = "loadbalancer.${count.index}"
  count = 5
  path = '/system/'
}
```

## This snippet is from the Count and Count Index video.

### iam-count-parameter.tf

```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

variable "elb_names" {
  type = list
  default = ["dev-loadbalancer", "stage-loadbalanacer","prod-loadbalancer"]
}

resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}
```
### count-paremeter.tf

```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}


resource "aws_instance" "instance-1" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   count = 3
}
```
