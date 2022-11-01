### eip.tf
```sh
resource "aws_eip" "myeip" {
  vpc = "true"
}
```
### providers.tf
No need provide access key and secret key if you have set up cli.
```sh
provider "aws" {
  region     =  "us-west-1"
}
```


### Documentation for Installing AWS CLI

https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

