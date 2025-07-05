# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

locals {
  primary_eks_cluster_name    = "${local.meta_environment_name}-${local.meta_component_name}-${local.handle}"
  primary_eks_iam_role_prefix = "${local.meta_environment_name}-${local.meta_component_name}-${local.handle}"
}
