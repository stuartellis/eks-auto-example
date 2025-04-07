# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "kubernetes_namespace" "flux_system" {
  metadata {
    name = "flux-system"
  }
}
