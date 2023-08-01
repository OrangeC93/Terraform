## Provisioners
Provisions are used to execute scripts on a local or remote machine as part of resource creataion or desctruction. For example: on creation of Web-Server, execute a script which installs Nginx web-server

## Main Two Types
- local exec: invoke local executable after resource is created
```sh
resource "aws_instance" "web" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.private_ip} >> private_ips.txt"
  }
}
```
- remote exec: invoke scripts directly on the remote server
```sh
resource "aws_instance" "web" {
  provisioner "remote-exec" {

  }
}
```

### Documentation Referenced:

https://www.terraform.io/language/resources/provisioners/remote-exec

https://www.terraform.io/language/resources/provisioners/connection

https://www.terraform.io/language/functions/file

### Base Code:
```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-KEY"
  secret_key = "YOUR-KEY"
}


resource "aws_instance" "myec2" {
   ami = "ami-0ca285d4c2cda3300"
   instance_type = "t2.micro"
}
```
### Final Code:


```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-KEY"
  secret_key = "YOUR-KEY"
}


resource "aws_instance" "myec2" {
   ami = "ami-0ca285d4c2cda3300"
   instance_type = "t2.micro"
   key_name = "terraform-key"

   connection {
   type     = "ssh"
   user     = "ec2-user"
   private_key = file("./terraform-key.pem")
   host     = self.public_ip
    }

 provisioner "remote-exec" {
   inline = [
     "sudo amazon-linux-extras install -y nginx1",
     "sudo systemctl start nginx"
   ]
 }
}
```

```sh
terraform init
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
```
