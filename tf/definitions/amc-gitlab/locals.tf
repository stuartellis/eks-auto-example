# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

locals {
  handle                            = var.stack_name
  standard_prefix                   = "${var.environment_name}-${var.variant}-${local.handle}"
  params_secrets_path_prefix        = "/stacks/${var.environment_name}/${local.handle}/${var.variant}"
  amc_gitlab_deploy_key_param_path  = "${local.params_secrets_path_prefix}/gitlab/ssh/deploykey"
  amc_gitlab_deploy_key_secret_path = "${local.params_secrets_path_prefix}/gitlab/ssh/deploykey"
  amc_gitlab_deploy_key_secret_name = "${local.standard_prefix}-deploykey"
}
