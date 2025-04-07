# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "kubernetes_secret" "flux_ssh_keypair" {
  metadata {
    name      = "ssh-keypair"
    namespace = "flux-system"
  }

  type = "Opaque"

  data = {
    "identity.pub" = "FIXME"
    "identity"     = "FIXME"
    "known_hosts"  = var.flux_config["ssh_known_hosts"]
  }

  depends_on = [kubernetes_namespace.flux_system]
}
