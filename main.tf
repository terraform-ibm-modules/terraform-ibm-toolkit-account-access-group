
/*** Create Access Groups for Admins and Users ***/
locals {  
  cloud-organization-admins = "CLOUD_ORGANIZATION_ADMINS"
  cloud-network-admins = "CLOUD_NETWORK_ADMINS"
  cloud-security-admins = "CLOUD_SECURITY_ADMINS"
  cloud-billing-admins = "CLOUD_BILLING_ADMINS"
  cloud-devops = "CLOUD_DEVOPS"
  cloud-developers = "CLOUD_DEVELOPERS"
}

resource ibm_iam_access_group org_admins {
  name = local.cloud-organization-admins
}
resource ibm_iam_access_group billing_admins {
  name = local.cloud-billing-admins
}
resource ibm_iam_access_group network_admins {
  name = local.cloud-network-admins
}
resource ibm_iam_access_group security_admins {
  name = local.cloud-security-admins
}
resource ibm_iam_access_group devops {
  name = local.cloud-devops
}
resource ibm_iam_access_group developers {
  name = local.cloud-developers
}

//cloud-organization-admins

resource ibm_iam_access_group_policy admin_policy_1 {
  access_group_id = ibm_iam_access_group.org_admins.id
  roles           = ["Administrator"]
  /*resources {
    resource_group_id = data.ibm_resource_group.group.id    
  }*/
}

resource ibm_iam_access_group_policy admin_policy_2 {
  access_group_id = ibm_iam_access_group.org_admins.id
  roles           = ["Administrator"]
  account_management = true  
}

resource ibm_iam_access_group_policy admin_policy_3 {
  access_group_id = ibm_iam_access_group.org_admins.id
  roles           = ["Editor"]
  resources {
    service = "support"    
  }  
}

//cloud-billing-admins

resource ibm_iam_access_group_policy billing_policy_1 {
  access_group_id = ibm_iam_access_group.billing_admins.id
  roles           = ["Administrator"]
  resources {
    service = "billing"
  }
}

resource ibm_iam_access_group_policy billing_policy_2 {
  access_group_id = ibm_iam_access_group.billing_admins.id
  roles           = ["Editor"]
  resources {
    service = "support"
  }
}

//cloud-network-admins

resource ibm_iam_access_group_policy network_policy_1 {
  access_group_id = ibm_iam_access_group.network_admins.id
  roles           = ["Administrator"]
  resources {
    service = "is"
  }
}

resource ibm_iam_access_group_policy network_policy_2 {
  access_group_id = ibm_iam_access_group.network_admins.id
  roles           = ["Viewer"]
}

resource ibm_iam_access_group_policy network_policy_3 {
  access_group_id = ibm_iam_access_group.network_admins.id
  roles           = ["Editor"]
  resources {
    service = "support"    
  }  
}

//cloud-security-admins

resource ibm_iam_access_group_policy security_policy_1 {
  access_group_id = ibm_iam_access_group.security_admins.id
  roles           = ["Viewer"]
  account_management = true  
}


resource ibm_iam_access_group_policy security_policy_2 {
  access_group_id = ibm_iam_access_group.security_admins.id
  roles           = ["Editor", "Administrator"]
  resources {
    service = "compliance"  
  }
}

resource ibm_iam_access_group_policy security_policy_3 {
  access_group_id = ibm_iam_access_group.security_admins.id
  roles           = ["Administrator", "User API key creator", "Service ID creator"]
  resources {
    service = "iam-identity"
  }
}

resource ibm_iam_access_group_policy security_policy_4 {
  access_group_id = ibm_iam_access_group.security_admins.id
  roles           = ["Administrator"]
  resources {
    service = "iam-groups"  
  }
}

resource ibm_iam_access_group_policy security_policy_5 {
  access_group_id = ibm_iam_access_group.security_admins.id
  roles           = ["Viewer"]
}

resource ibm_iam_access_group_policy security_policy_7 {
  access_group_id = ibm_iam_access_group.security_admins.id
  roles           = ["Viewer", "Reader"]

  resources {
    service           = "containers-kubernetes"
  }
}

//cloud-devops

resource ibm_iam_access_group_policy devops_policy_1 {
  access_group_id = ibm_iam_access_group.devops.id
  roles           = ["Viewer"]
}

resource ibm_iam_access_group_policy devops_policy_2 {
  access_group_id = ibm_iam_access_group.devops.id
  roles           = ["Administrator","Manager"]
  resources {
    service = "logdnaat"  
  }
}

resource ibm_iam_access_group_policy devops_policy_3 {
  access_group_id = ibm_iam_access_group.devops.id
  roles           = ["Administrator","Manager"]

  resources {
    service           = "containers-kubernetes"
  }
}

resource ibm_iam_access_group_policy devops_policy_4 {
  access_group_id = ibm_iam_access_group.devops.id
  roles           = ["Viewer", "Operator"]
  resources {
    service = "is"
  }
}

resource ibm_iam_access_group_policy devops_policy_5 {
  access_group_id = ibm_iam_access_group.devops.id
  roles           = ["Editor"]
  resources {
    service = "support"    
  }  
}

//cloud-developers

resource ibm_iam_access_group_policy developer_policy_1 {
  access_group_id = ibm_iam_access_group.developers.id
  roles           = ["Administrator", "Manager"]

  resources {
    service           = "containers-kubernetes"
  }
}

resource ibm_iam_access_group_policy developer_policy_2 {
  access_group_id = ibm_iam_access_group.developers.id
  roles           = ["Editor"]
  resources {
    service = "support"    
  }  
}
