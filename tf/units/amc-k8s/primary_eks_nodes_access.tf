# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "aws_eks_access_entry" "primary_auto_modes_nodes" {
  cluster_name  = module.primary_eks_cluster.cluster_name
  principal_arn = module.primary_eks_cluster.node_iam_role_arn
  type          = "EC2"
}

resource "aws_eks_access_policy_association" "primary_auto_modes_nodes" {
  cluster_name  = module.primary_eks_cluster.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAutoNodePolicy"
  principal_arn = module.primary_eks_cluster.node_iam_role_arn

  access_scope {
    type = "cluster"
  }
}
