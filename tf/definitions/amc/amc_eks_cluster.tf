# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

module "amc_eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.35"

  cluster_name    = local.amc_eks_cluster_name
  cluster_version = var.eks_cluster_config["k8s_version"]

  cluster_endpoint_public_access = var.eks_cluster_config["endpoint_public_access"]

  dataplane_wait_duration = var.eks_cluster_config["dataplane_wait_duration"]

  # Adds the current caller identity as an administrator with a cluster access entry
  enable_cluster_creator_admin_permissions = var.eks_cluster_config["enable_creator_admin_permissions"]

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose", "system"]
  }

  vpc_id     = var.eks_cluster_config["vpc_id"]
  subnet_ids = var.eks_cluster_config["subnet_ids"]

  tags = {
    Name = local.amc_eks_cluster_name
  }
}

data "aws_eks_cluster_auth" "amc" {
  name = module.amc_eks_cluster.cluster_name
}
