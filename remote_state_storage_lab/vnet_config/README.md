File: `backend-config.tfbackend`

```
resource_group_name  = "RESOURCE_GROUP_NAME"
storage_account_name = "STORAGE_ACCOUNT_NAME"
container_name       = "tfstate"
key                  = "terraform.tfstate"
use_azuread_auth     = true
```

```
terraform init -backend-config="backend-config.tfbackend"
```