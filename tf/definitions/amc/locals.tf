# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

locals {
  handle               = var.stack_name
  amc_eks_cluster_name = "${var.environment_name}-${local.handle}-${var.variant}"
}
