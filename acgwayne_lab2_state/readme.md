The purpose of this lab is to get experience with `terraform login` and to store state in Terraform Cloud.

Prerequisites: A Terraform Cloud account

Saving state in Terraform Cloud requires configuring an API token.  The token itself is stored in `$HOME/.terraform.d/`

Terraform cloud provides sample code.  It looks something like this:
```hcl
terraform {
  
  cloud { 
    
    organization = "streamless-the-org" 

    workspaces { 
      name = "hello-workspace" 
    } 
  } 
}
```
