# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "aws_ssm_parameter" "tft_unit_present" {
  name  = "/metadata/${var.product_name}/${var.unit_name}/${var.environment_name}/${var.variant}/present"
  type  = "String"
  value = "true"
}
