module "access_groups" {
  source = "./module"

  ibmcloud_api_key = var.ibmcloud_api_key
}
