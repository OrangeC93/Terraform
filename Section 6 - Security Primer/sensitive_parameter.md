## Overview of Sensitive Parameter
With orgnaization managing their entire infrastructure in terraform, it's likely that you will see some sensitive information embedded in the code. When working with a field that contains information likely to be consifered sensitive, it's best to set a Sensitive property on its schema to true

```sh
output "db_password" {
  value = aws_db_instance.db.password
  description = "The password for logging in to the database"
  sensitive = true
}
```
## Overview of Sensitive Parameter
Setting the sensitive to "true" will prevent the field's value from showing up in CLI output and in Terraform Cloud. It will not encrypt or obscure the value in the state, however.
