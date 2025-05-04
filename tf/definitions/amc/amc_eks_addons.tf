# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "aws_eks_addon" "external_dns" {
  cluster_name = local.amc_eks_cluster_name
  addon_name   = "external-dns"
}
