# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "kubernetes_secret" "flux_ssh_keypair" {
  metadata {
    name      = local.gitlab_deploy_keypair_name
    namespace = "flux-system"
  }

  type = "Opaque"

  data = {
    "identity.pub" = jsondecode(data.aws_secretsmanager_secret_version.flux_ssh_keypair.secret_string)["public-key"]
    "identity"     = jsondecode(data.aws_secretsmanager_secret_version.flux_ssh_keypair.secret_string)["private-key"]
    "known_hosts"  = jsondecode(data.aws_secretsmanager_secret_version.flux_ssh_keypair.secret_string)["ssh-known-hosts"]
  }

  depends_on = [kubernetes_namespace.flux_system]
}
