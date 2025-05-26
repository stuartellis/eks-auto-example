# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

output "ssm_param_meta_tft_unit_present_path" {
  value       = aws_ssm_parameter.tft_unit_present.name
  description = "The path of the SSM Parameter present for a deployed TF root module."
}

output "tft_handle" {
  value       = local.tft_handle
  description = "The normalized identifier for resources that use this TF root module."
}

output "tft_standard_prefix" {
  value       = local.tft_standard_prefix
  description = "The default prefix for resources that use this TF root module."
}
