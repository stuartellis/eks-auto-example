# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

variable "tf_exec_role_arn" {
  type = string
}

variable "eks_cluster_identifier" {
  type = string
}

variable "flux_config" {
  type = object({
    flux_version            = string
    flux_sync_version       = string
    flux_sync_interval      = string
    git_url                 = string
    kustomization_root_path = string
    git_branch              = string
  })
}

variable "gitlab_ssm_params_identifier" {
  type = string
}
