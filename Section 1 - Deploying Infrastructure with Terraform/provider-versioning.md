
### Different Version Parameters used in video:
```sh
version    = "2.7"
version    = ">= 2.8"
version    = "<= 2.8"
version    = ">=2.10,<=2.30"
```

### Base Configuration - provider.versioning.tf

```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
  version    = ">=2.10,<=2.30"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}
```

Note: .lock.hcl allows us to lock to a specific version of provider. If a particular provider already has a selection recorded in the lock files, Terraform will always re-select that version for installation, even if a newer version has become available. You can overide that behavior by adding the -upgrade option when you run terraform init.

```sh
terraform init -upgrade
```
