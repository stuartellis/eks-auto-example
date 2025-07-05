# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

data "aws_route53_zone" "amc_domain" {
  name = var.amc_domain_name
}
