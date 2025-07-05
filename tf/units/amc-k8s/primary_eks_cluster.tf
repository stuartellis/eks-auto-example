# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

module "primary_eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.35"

  cluster_name    = local.primary_eks_cluster_name
  cluster_version = var.primary_eks_cluster_config["k8s_version"]

  cluster_endpoint_public_access = var.primary_eks_cluster_config["endpoint_public_access"]

  dataplane_wait_duration = var.primary_eks_cluster_config["dataplane_wait_duration"]

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose", "system"]
  }

  vpc_id     = var.primary_eks_cluster_config["vpc_id"]
  subnet_ids = var.primary_eks_cluster_config["subnet_ids"]

  # Adds the current caller identity as an administrator with a cluster access entry
  authentication_mode                      = "API"
  enable_cluster_creator_admin_permissions = var.primary_eks_cluster_config["enable_creator_admin_permissions"]

  access_entries = {
    aws_admin_role = {
      kubernetes_groups = []
      principal_arn     = var.human_admins_role_arn
      policy_associations = {
        kubeadmin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            namespaces = []
            type       = "cluster"
          }
        }
      }
    }
  }

  cluster_addons = {
    amazon-cloudwatch-observability = {
      most_recent              = true
      service_account_role_arn = module.primary_eks_iam_cloudwatch_agent_role.iam_role_arn
    }
    external-dns = {
      most_recent              = true
      service_account_role_arn = module.primary_eks_iam_external_dns_role.iam_role_arn
    }
  }

  tags = {
    Name = local.primary_eks_cluster_name
  }
}

data "aws_eks_cluster_auth" "amc" {
  name = module.primary_eks_cluster.cluster_name
}
