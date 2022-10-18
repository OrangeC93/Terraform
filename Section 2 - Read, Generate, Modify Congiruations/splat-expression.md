## Overview of Spalat Expression
Splat Expression allows us to get a list of all the attributes. 

## This snippet is from the Splat Expression Video.

### splat.tf

```sh

provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}
resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}
```

```sh
output:
arns = [
"arn:aws:iam:7889567893344:user/system/iamuser.0",
"arn:aws:iam:7889567893344:user/system/iamuser.1",
"arn:aws:iam:7889567893344:user/system/iamuser.2"
]
```
