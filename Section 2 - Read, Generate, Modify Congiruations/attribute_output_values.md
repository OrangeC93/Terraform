Understaing Attributes: terraform has capability to output the attribute of a resource with the output values.
- Example: ec2_public_ip = 35.161.21.197

Attribute are important: an outpute attributes can not only be used for the  user reference but it can also act as an input to other resources being created via terraform
- Example: after EIP get created, it's IP address should automatically get whitelisted in the security group

Attribute Reference under each resource: list of attribute you can output
- Example: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

In tfstate file:
- Output basically contains all the output attribute which you might had defined whithin your TF files
- Resources are the actual underlying resource with have been created through Terraform

