# IBM Cloud Access Group creation module

Terraform module to provision account-wide access groups in accordance FS cloud recommendations. In all, six access groups are created by this module:

- CLOUD_ORGANIZATION_ADMINS
- CLOUD_NETWORK_ADMINS
- CLOUD_SECURITY_ADMINS
- CLOUD_BILLING_ADMINS
- CLOUD_DEVOPS
- CLOUD_DEVELOPERS

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v13

### Terraform providers

- IBM Cloud provider >= 1.5.3

## Example usage

```hcl-terraform
module "access_groups" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-account-access-group.git?ref=v1.0.0"
  
  ibmcloud_api_key = var.ibmcloud_api_key
}
```
