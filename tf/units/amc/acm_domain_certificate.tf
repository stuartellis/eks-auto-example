# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "aws_acm_certificate" "domain_cert" {
  domain_name               = var.domain_name
  subject_alternative_names = ["*.${var.domain_name}"]
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "domain_cert_dns" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.domain_cert.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.domain_cert.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.domain_cert.domain_validation_options)[0].resource_record_type
  zone_id         = data.aws_route53_zone.domain.zone_id
  ttl             = 60
}

resource "aws_acm_certificate_validation" "domain_cert_validation" {
  certificate_arn         = aws_acm_certificate.domain_cert.arn
  validation_record_fqdns = [aws_route53_record.domain_cert_dns.fqdn]
}

resource "aws_ssm_parameter" "domain_cert_arn" {
  name  = "/resources/${var.product_name}/${var.unit_name}/${var.environment_name}/${var.variant}/acm/cert/arn"
  type  = "String"
  value = aws_acm_certificate.domain_cert.arn
}
