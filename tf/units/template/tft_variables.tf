# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#
# Required tfvars for tft:
#
# https://github.com/stuartellis/tf-tasks
#
# Use locals to define resource names, tags and labels.
# Only use these tft variables in locals. Never use them directly in code.
# See meta_locals.tf for standard locals to use in resource names.

variable "tft_environment_name" {
  type        = string
  description = "TFT: Environment name."
}

variable "tft_product_name" {
  type        = string
  description = "TFT: Product name."
}

variable "tft_unit_name" {
  type        = string
  description = "TFT: Unit name."
}

variable "tft_edition_name" {
  type        = string
  description = "TFT: Edition."
}
