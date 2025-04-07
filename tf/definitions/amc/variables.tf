# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

variable "eks_cluster_config" {
  type = object({
    k8s_version                      = string
    dataplane_wait_duration          = string
    endpoint_public_access           = bool
    enable_creator_admin_permissions = bool
    subnet_ids                       = list(string)
    vpc_id                           = string
  })
}

variable "human_admins_role_arn" {
  type = string
}

variable "tf_exec_role_arn" {
  type = string
}
