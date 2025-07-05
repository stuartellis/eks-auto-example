# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "aws_acm_certificate" "amc_wildcard_cert" {
  domain_name               = var.amc_domain_name
  subject_alternative_names = ["*.${var.amc_domain_name}"]
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "amc_wildcard_cert_dns" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.amc_wildcard_cert.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.amc_wildcard_cert.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.amc_wildcard_cert.domain_validation_options)[0].resource_record_type
  zone_id         = data.aws_route53_zone.amc_domain.zone_id
  ttl             = 60
}

resource "aws_acm_certificate_validation" "amc_wildcard_cert_validation" {
  certificate_arn         = aws_acm_certificate.amc_wildcard_cert.arn
  validation_record_fqdns = [aws_route53_record.amc_wildcard_cert_dns.fqdn]
}

resource "aws_ssm_parameter" "amc_wildcard_cert_arn" {
  name  = "/config/${local.meta_product_name}/${local.meta_environment_name}/${local.meta_component_name}/${local.meta_edition}/acm/cert/wildcard/arn"
  type  = "String"
  value = aws_acm_certificate.amc_wildcard_cert.arn
}
