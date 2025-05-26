# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

locals {
  tft_handle              = substr(lower(var.unit_name), 0, 12)
  amc_eks_cluster_name    = "${var.environment_name}-${local.tft_handle}-${var.variant}"
  amc_eks_iam_role_prefix = "${var.environment_name}-${local.tft_handle}-${var.variant}"
}
