# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

locals {
  tft_handle                        = substr(lower(var.unit_name), 0, 12)
  standard_prefix                   = "${var.environment_name}-${var.variant}-${local.tft_handle}"
  params_secrets_path_prefix        = "/resources/${var.environment_name}/${local.tft_handle}/${var.variant}"
  amc_gitlab_deploy_key_param_path  = "${local.params_secrets_path_prefix}/gitlab/ssh/deploykey"
  amc_gitlab_deploy_key_secret_path = "${local.params_secrets_path_prefix}/gitlab/ssh/deploykey"
  amc_gitlab_deploy_key_secret_name = "${local.standard_prefix}-deploykey"
}
