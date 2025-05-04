# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

data "aws_route53_zone" "domain" {
  name = var.domain_name
}
