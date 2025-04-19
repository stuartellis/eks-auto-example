# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

locals {
  handle                       = var.stack_name
  eks_cluster_name             = "${var.environment_name}-${var.amc_eks_cluster_identifier}-${var.variant}"
  gitlab_deploy_key_param_path = "/stacks/${var.environment_name}/${var.gitlab_ssm_params_identifier}/${var.variant}/gitlab/ssh/deploykey"
  kustomization_path           = "${var.amc_flux_config["kustomization_root_path"]}/${local.eks_cluster_name}"
}
