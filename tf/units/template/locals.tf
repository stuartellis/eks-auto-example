# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

locals {
  tft_handle          = substr(lower(var.unit_name), 0, 12)
  tft_standard_prefix = "${var.environment_name}-${var.variant}-${local.tft_handle}"
}
