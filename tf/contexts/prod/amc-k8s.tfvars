# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

# Required: ARN for IAM role for human administrators
human_admins_role_arn = "arn:aws:iam::333594256635:role/stuartellis-org-human-ops-role"

# Required: ARN for IAM role for TF
tf_exec_role_arn = "arn:aws:iam::333594256635:role/stuartellis-org-tf-exec-role"

primary_eks_cluster_config = {
  dataplane_wait_duration          = "60s"
  endpoint_public_access           = true
  enable_creator_admin_permissions = true

  # Required: Kubernetes version
  k8s_version = "1.32"

  # Required: Subnets for the EKS cluster
  subnet_ids = ["subnet-07b4d67d", "subnet-5ac87816", "subnet-eca28485", ]

  # Required: VPC that holds the subnets for the EKS cluster
  vpc_id = "vpc-ac85d9c4"
}
