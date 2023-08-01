# Domain  - Deploying Infrastructure with Terraform

The code mentioned in this document are used in the HashiCorp Certified Terraform Associate 2022 video course.


# Video-Document Mapper

| Sr No | Document Link |
| ------ | ------ |
| 1 | [Creating first EC2 instance with Terraform][PlDa] |
| 2 | [Understanding Resource & Providers][PlDb] |
| 3 | [Understanding Resource & Providers - Part 2][PlDc] |
| 4 | [Destroying Infrastructure with Terraform (NEW)][PlDd] |
| 5 | [Terraform Provider Versioning][PlDe] |
| 6 | [Terraform State Files][PlDf] |
| 7 | [Current Desired State][PlDg] |




   [PlDa]: <./first-ec2.md>
   [PlDb]: <./resp01.md>   
   [PlDc]: <./github.md>
   [PlDd]: <./destroy.md>   
   [PlDe]: <./provider-versioning.md>
   [PlDf]: <./state_file.md>
   [PlDg]: <./desired_current_state.md>

# Resources

https://docs.google.com/document/d/179clqsxOGQa-iGKu1dcmz89Vpso9-7Of8opIkXwPr_k/edit?usp=sharing

[Terraform Wrokflow](https://k21academy.com/terraform-iac/terraform-workflow-and-its-use-case/#:~:text=Init%20%E2%80%93%20this%20is%20where%20you,apply%20them%20against%20real%20infrastructure): 
- Write – this is where you create changes to the code.
- Init – this is where you initialize your code to download the requirements mentioned in your code.
- Plan – this is where you review changes and choose whether to simply accept them.
- Apply – this is where you accept changes and apply them against real infrastructure.
- Destroy – this is where to destroy all your created infrastructure.
