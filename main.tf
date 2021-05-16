
/*** Create Access Groups for Admins and Users ***/
locals {  
  cloud-organization-admins = "${replace(upper(var.resource_group_name), "-", "_")}_ORG_ADMIN"  
  cloud-billing-admins = "${replace(upper(var.resource_group_name), "-", "_")}_BILL_ADMIN"
  cloud-network-admins = "${replace(upper(var.resource_group_name), "-", "_")}_NET_ADMIN"
  cloud-security-admins = "${replace(upper(var.resource_group_name), "-", "_")}_SEC_ADMIN"
  cloud-devops = "${replace(upper(var.resource_group_name), "-", "_")}_DEVOPS_USER"
  cloud-developers = "${replace(upper(var.resource_group_name), "-", "_")}_DEV_USER"

}

resource "null_resource" "print_names" {
  provisioner "local-exec" {
    command = "echo 'Resource group: ${var.resource_group_name}'"
  }
  provisioner "local-exec" {
    command = "echo 'Cloud-organization access group: ${local.cloud-organization-admins}'"
  }
  provisioner "local-exec" {
    command = "echo 'Cloud Network access group: ${local.cloud-network-admins}'"
  }
  provisioner "local-exec" {
    command = "echo 'Cloud Security access group: ${local.cloud-security-admins}'"
  }
  provisioner "local-exec" {
    command = "echo 'Cloud Billing access group: ${local.cloud-billing-admins}'"
  }
  provisioner "local-exec" {
    command = "echo 'Cloud Devops access group: ${local.cloud-devops}'"
  }
  provisioner "local-exec" {
    command = "echo 'Cloud Developers access group: ${local.cloud-developers}'"
  }
}

data ibm_resource_group resource_group {
  depends_on = [null_resource.print_names]

  name = var.resource_group_name
}

// create access groups

resource ibm_iam_access_group orgadminsgrp {
  name = local.cloud-organization-admins
}
resource ibm_iam_access_group billadmingrp {
  name = local.cloud-billing-admins
}
resource ibm_iam_access_group networkadmingrp {
  name = local.cloud-network-admins
}
resource ibm_iam_access_group securityadmingrp {
  name = local.cloud-security-admins
}
resource ibm_iam_access_group devopsgrp {
  name = local.cloud-devops
}
resource ibm_iam_access_group developersgrp {
  name = local.cloud-developers
}

//cloud-organization-admins

resource "ibm_iam_access_group_policy" "policy_1" {
  access_group_id = ibm_iam_access_group.orgadminsgrp.id
  roles           = ["Administrator"]
  /*resources {
    resource_group_id = data.ibm_resource_group.group.id    
  }*/
}

resource "ibm_iam_access_group_policy" "policy_2" {
  access_group_id = ibm_iam_access_group.orgadminsgrp.id
  roles           = ["Administrator"]
  account_management = true  
}

resource "ibm_iam_access_group_policy" "policy_3" {
  access_group_id = ibm_iam_access_group.orgadminsgrp.id
  roles           = ["Editor"]
  resources {
    service = "support"    
  }  
}

//cloud-billing-admins

resource "ibm_iam_access_group_policy" "policy_4" {
  access_group_id = ibm_iam_access_group.billadmingrp.id
  roles           = ["Editor"]
  resources {
    service = "support"    
  }  
}

//cloud-network-admins

resource "ibm_iam_access_group_policy" "policy_5" {
  access_group_id = ibm_iam_access_group.networkadmingrp.id
  roles           = ["Administrator"]
  resources {
    service = "is"
  }
}

resource "ibm_iam_access_group_policy" "policy_6" {
  access_group_id = ibm_iam_access_group.networkadmingrp.id
  roles           = ["Viewer"]
  resources {
    service = "iam-groups"  
  }
}
resource "ibm_iam_access_group_policy" "policy_7" {
  access_group_id = ibm_iam_access_group.networkadmingrp.id
  roles           = ["Editor"]
  resources {
    service = "support"    
  }  
}

//cloud-security-admins

resource "ibm_iam_access_group_policy" "policy_8" {
  access_group_id = ibm_iam_access_group.securityadmingrp.id
  roles           = ["Viewer"]
  account_management = true  
}


resource "ibm_iam_access_group_policy" "policy_9" {
  access_group_id = ibm_iam_access_group.securityadmingrp.id
  roles           = ["Editor"]
  resources {
    service = "compliance"  
  }
}

resource "ibm_iam_access_group_policy" "policy_10" {
  access_group_id = ibm_iam_access_group.securityadmingrp.id
  roles           = ["Administrator", "Manager"]  
}


resource "ibm_iam_access_group_policy" "policy_11" {
  access_group_id = ibm_iam_access_group.securityadmingrp.id
  roles           = ["Administrator"]
  resources {
    service = "iam-groups"  
  }
}


resource "ibm_iam_access_group_policy" "policy_12" {

  access_group_id = ibm_iam_access_group.securityadmingrp.id
  roles           = ["Viewer", "Reader"]

  resources {
    service           = "containers-kubernetes"
    resource_group_id = data.ibm_resource_group.resource_group.id
  }
}

//cloud-devops

resource "ibm_iam_access_group_policy" "policy_13" {
  access_group_id = ibm_iam_access_group.devopsgrp.id
  roles           = ["Viewer"]
  resources {
    service = "iam-groups"  
  }
}

resource "ibm_iam_access_group_policy" "policy_14" {
  access_group_id = ibm_iam_access_group.devopsgrp.id
  roles           = ["Administrator","Manager"]
  resources {
    service = "logdnaat"  
  }
}

resource "ibm_iam_access_group_policy" "policy_15" {

  access_group_id = ibm_iam_access_group.devopsgrp.id
  roles           = ["Administrator","Manager"]

  resources {
    service           = "containers-kubernetes"
    resource_group_id = data.ibm_resource_group.resource_group.id
  }
}


resource "ibm_iam_access_group_policy" "policy_16" {
  access_group_id = ibm_iam_access_group.devopsgrp.id
  roles           = ["Viewer", "Operator"]
  resources {
    service = "is"
  }
}

resource "ibm_iam_access_group_policy" "policy_17" {
  access_group_id = ibm_iam_access_group.devopsgrp.id
  roles           = ["Editor"]
  resources {
    service = "support"    
  }  
}

//cloud-developers

resource "ibm_iam_access_group_policy" "policy_18" {
  access_group_id = ibm_iam_access_group.developersgrp.id
  roles           = ["Viewer"]
  resources {
    service = "iam-groups"  
  }
}


resource "ibm_iam_access_group_policy" "policy_19" {

  access_group_id = ibm_iam_access_group.developersgrp.id
  roles           = ["Administrator", "Manager"]

  resources {
    service           = "containers-kubernetes"
    resource_group_id = data.ibm_resource_group.resource_group.id
  }
}


resource "ibm_iam_access_group_policy" "policy_20" {
  access_group_id = ibm_iam_access_group.developersgrp.id
  roles           = ["Editor"]
  resources {
    service = "support"    
  }  
}




