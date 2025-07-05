# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

module "primary_eks_iam_cloudwatch_agent_role" {
  source                                 = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version                                = "5.55.0"
  role_name                              = "${local.primary_eks_iam_role_prefix}-cloudwatch-agent"
  attach_cloudwatch_observability_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.primary_eks_cluster.oidc_provider_arn
      namespace_service_accounts = ["cloudwatch-agent:amazon-cloudwatch"]
    }
  }
}

module "primary_eks_iam_external_dns_role" {
  source                     = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version                    = "5.55.0"
  role_name                  = "${local.primary_eks_iam_role_prefix}-ext-dns"
  attach_external_dns_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.primary_eks_cluster.oidc_provider_arn
      namespace_service_accounts = ["external-dns:external-dns"]
    }
  }
}
