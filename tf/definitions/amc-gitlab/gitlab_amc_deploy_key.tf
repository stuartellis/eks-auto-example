# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "tls_private_key" "amc_flux" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "gitlab_deploy_key" "amc_flux" {
  project  = data.gitlab_project.this.path_with_namespace
  title    = local.amc_gitlab_deploy_key_secret_name
  key      = tls_private_key.amc_flux.public_key_openssh
  can_push = true
}
