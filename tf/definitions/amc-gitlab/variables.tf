# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

variable "aws_secrets_recovery_window" {
  type = number
}

variable "gitlab_project_id" {
  type = string
}

variable "gitlab_ssh_known_hosts" {
  type = string
}

variable "human_admins_role_arn" {
  type = string
}

variable "tf_exec_role_arn" {
  type = string
}
