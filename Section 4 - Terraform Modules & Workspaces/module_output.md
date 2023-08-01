# Revisiing Output
Output values make information about your infrastructure available on the command line and can expose info for other Terraform configuration to use. 

```sh
output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
```

# Accessing Child Module Output
In a parent module, outputs of child modules are available in expressions as module. <MODULE NAME>.<OUTPUT NAME>
