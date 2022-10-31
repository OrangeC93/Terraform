
## Supported Module Souce
The source argument in a module block tells Terraform where to find the source code for the desired child module.
- Local paths
- Terraform Registry
- GitHub
- BitBucket
- Generic Git, Mercurial repositories
- HTTP URLs
- S3 bucket
- GCS buckets
- 
## Documentation Referred:

https://www.terraform.io/docs/modules/sources.html#github

## GIT Sources used during demo:

### Example 0: Local Path:
A local path must begin with either ./ or ../to indicate that a local path is intended
``
module "consul" {
  source = "../consul"
}
``
### Example 1: Generic GIT Repository:
Arbitrary Git repositories can be used by prefixing the address with the special git:: prefix. After this prefix, any valid Git URL can be specified to select one of the protocals supported by Git.
```sh
module "demomodule" {
  source = "git::https://github.com/zealvora/tmp-repo.git"
}
```

### Example 2: Generic GIT Repository with Specific branch:
By default, Terraform will clone and use the default branch in the selected repository. You can override this using the ref argument. The value of the ref argument can be any reference that would be accepted by the git checkout command, including branch and tag name.
```sh
module "demomodule" {
  source = "git::https://github.com/zealvora/tmp-repo.git?ref=development"
}
```

### Example 3: GitHub Source:
```sh
module "demomodule" {
  source = "github.com/zealvora/tmp-repo"
}
```

### Initialization Command:
```sh
terraform init
```
