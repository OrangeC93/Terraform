## Terraform Output
The terraform output command is used to extract the value of an output variable from the state file.


```sh
terraform output iam_names
[
  "iamuser.0",
  "iamuser.1",
  "iamuser.2"
]
```

## Code

```sh
provider "aws" {=
}

resource "aws_iam_user" "lb" {
  name = 'iamuser.${count.index}'
  count = 3
  path = "/system/"
}

output "iam_names" {
  value = aws_iam_user.lb[*].name
}

output "iam_arn" {
  value = aws_iam_user.lb[*].arn
}

```
