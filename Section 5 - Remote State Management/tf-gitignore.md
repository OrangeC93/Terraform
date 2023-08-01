## Terraform and .gitignore
Depending on the env, it's recommended to avoid commiting certain files to GIT
- .terraform: this file will be recreated when terraform init is run
- terraform.tfvars: likely to contain sernsitive data like username/passwords and secrets
- terraform.tfstate: should be stored in the remote side
- crash.log: if terraform crashed, the logs are stored to a file named crash.log
### Documents Referred:

GitHub gitignore repository:

https://github.com/github/gitignore

### Step 1: Cloning Custom Repository:
```sh
git clone https://github.com/zealvora/tmp-repo.git
```
### Step 2: Creating example tfvars file:
```sh
nano example.tfvars
```
```sh
username = "admin"
password = "password"
```
### Step 3: Apply the changes:
```sh
terraform apply
```
### Step 4: Create a .gitignore file:
```sh
nano .gitignore
```
```sh
.terraform
*.tfvars
terraform.tfstate
```
Step 5: Verify status:
```sh
git status
```
