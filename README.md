# IBM Cloud Access Group creation module

Terraform module to provision account-wide access groups in accordance FS cloud recommendations. In all, six access groups are created by this module:

- CLOUD_ORGANIZATION_ADMINS
- CLOUD_NETWORK_ADMINS
- CLOUD_SECURITY_ADMINS
- CLOUD_BILLING_ADMINS
- CLOUD_DEVOPS
- CLOUD_DEVELOPERS

**Note:** This module follows the Terraform conventions regarding how provider configuration is defined within the Terraform template and passed into the module - https://www.terraform.io/docs/language/modules/develop/providers.html. The default provider configuration flows through to the module. If different configuration is required for a module, it can be explicitly passed in the `providers` block of the module - https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly.

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v13

### Terraform providers

- IBM Cloud provider >= 1.5.3

## Example usage

```hcl-terraform
terraform {
  required_providers {
    ibm = {
      source = "ibm-cloud/ibm"
    }
  }
  required_version = ">= 0.13"
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
}

module "access_groups" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-account-access-group.git?ref=v1.0.0"
}
```
