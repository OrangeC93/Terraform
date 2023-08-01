## Common Challenges
One common need on infrastructure management is to build environment like staging, production with similar setup but keeping environemtn variables different.
- Staging instance_type = t2.micro
- Production isntance_type = m4.large


If you hardcoded the things within your module, then you will not be able to override it. You should create a variable with default instance type and use it in the resource creation, and this time you can change the instance type in module. 
