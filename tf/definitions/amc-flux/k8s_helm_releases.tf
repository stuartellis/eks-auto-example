# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "helm_release" "flux2" {
  repository = "https://fluxcd-community.github.io/helm-charts"
  chart      = "flux2"
  version    = var.amc_flux_config["flux_version"]

  name      = "flux2"
  namespace = "flux-system"

  depends_on = [kubernetes_namespace.flux_system]
}

resource "helm_release" "flux2_sync" {
  repository = "https://fluxcd-community.github.io/helm-charts"
  chart      = "flux2-sync"
  version    = var.amc_flux_config["flux_sync_version"]

  name      = "flux-system"
  namespace = "flux-system"

  set {
    name  = "gitRepository.spec.url"
    value = var.amc_flux_config["git_url"]
  }

  set {
    name  = "gitRepository.spec.ref.branch"
    value = var.amc_flux_config["git_branch"]
  }

  set {
    name  = "gitRepository.spec.secretRef.name"
    value = jsondecode(data.aws_secretsmanager_secret_version.amc_flux_ssh_keypair.secret_string)["name"]
  }

  set {
    name  = "gitRepository.spec.interval"
    value = var.amc_flux_config["flux_sync_interval"]
  }

  set {
    name  = "kustomization.spec.path"
    value = local.kustomization_path
  }

  depends_on = [helm_release.flux2]
}
