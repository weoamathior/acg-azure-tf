
Authentication Steps
* Ensure no other azure session is active and that you haven't set any ARM_ environment variables
* Login through `az login` 

`terraform.tfvars`

```
resource_group_name = "the-group-name"
prefix              = "the-unique-prefix"
```
