# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

human_admins_role_arn = "arn:aws:iam::333594256635:role/stuartellis-org-human-ops-role"

tf_exec_role_arn = "arn:aws:iam::333594256635:role/stuartellis-org-tf-exec-role"

domain_name = "amc-dev.stuartellis.org"

eks_cluster_config = {
  k8s_version                      = "1.32"
  dataplane_wait_duration          = "60s"
  endpoint_public_access           = true
  enable_creator_admin_permissions = true
  subnet_ids                       = ["subnet-07b4d67d", "subnet-5ac87816", "subnet-eca28485", ]
  vpc_id                           = "vpc-ac85d9c4"
}
