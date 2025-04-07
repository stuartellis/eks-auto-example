# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "helm_release" "flux2" {
  repository = "https://fluxcd-community.github.io/helm-charts"
  chart      = "flux2"
  version    = var.flux_config["flux_version"]

  name      = "flux2"
  namespace = "flux-system"

  depends_on = [kubernetes_namespace.flux_system]
}

resource "helm_release" "flux2_sync" {
  repository = "https://fluxcd-community.github.io/helm-charts"
  chart      = "flux2-sync"
  version    = var.flux_config["flux_sync_version"]

  name      = "flux-system"
  namespace = "flux-system"

  set {
    name  = "gitRepository.spec.url"
    value = var.flux_config["git_url"]
  }

  set {
    name  = "gitRepository.spec.ref.branch"
    value = var.flux_config["git_branch"]
  }

  set {
    name  = "gitRepository.spec.secretRef.name"
    value = kubernetes_secret.flux_ssh_keypair.metadata[0].name
  }

  set {
    name  = "gitRepository.spec.interval"
    value = var.flux_config["flux_sync_interval"]
  }

  set {
    name  = "kustomization.spec.path"
    value = local.kustomization_path
  }

  depends_on = [helm_release.flux2]
}
