## Provisioners are interesting
## Local-exec provisioners allows us to invoke a local executable after the resource is created.
## One of the most used approach of local-exec is to run an sible-playbooks on the created server after the resource is created

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"

   provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }
}

