# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

locals {
  tft_handle                   = substr(lower(var.unit_name), 0, 12)
  eks_cluster_name             = "${var.environment_name}-${var.eks_cluster_identifier}-${var.variant}"
  gitlab_deploy_key_param_path = "/resources/${var.environment_name}/${var.gitlab_ssm_params_identifier}/${var.variant}/gitlab/ssh/deploykey"
  gitlab_deploy_keypair_name   = "${var.environment_name}-${var.eks_cluster_identifier}-${var.variant}-deploykey"
  kustomization_path           = "${var.flux_config["kustomization_root_path"]}/${local.eks_cluster_name}"
}
