## Local Backends
Backends primarily determine where Terraform stores its states. By default, Terraform implicitly uses a backend called local to store state as a local file on disk.

## Challenge with Local Backend
Not allow collaboration

## Ideal Architecutre
- Stored in Git Repo, like TF files
- The State file is stored in a Central backend, like terraform.tfstate

## Backends Supported in Terraform
Terraform supports multiple backends that allows remote service related operations. Some of the popular backends include: 
- S3
- Consul
- Azurerm
- Kubernetes
- HTTP
- ETCD
