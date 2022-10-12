Desired State: Terraform's primary function is to create, modify, and destroy in frastructure resources to match the desired state described in a Terraform configuration.

Current State: current state is the actual state of a resource that is currently deployed.

Important Pointer: Terraform tries to ensure that the deployed infrastructure is based on the desired state. If there's a difference between the two, terraform plan presents a description of changes necessary to achieve the desired state. 


Challenges with the current state on computed values: 


```sh
terraform refresh ## the desired state will be changed to current state
```
