# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

locals {
  handle             = var.stack_name
  eks_cluster_name   = "${var.environment_name}-${local.handle}-${var.variant}"
  kustomization_path = "${var.flux_config["kustomization_root_path"]}/${local.eks_cluster_name}"
}
