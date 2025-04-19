# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "aws_secretsmanager_secret" "amc_flux_ssh_keypair" {
  name                    = local.amc_gitlab_deploy_key_secret_path
  recovery_window_in_days = var.aws_secrets_recovery_window
}

resource "aws_secretsmanager_secret_version" "amc_flux_ssh_keypair" {
  secret_id = aws_secretsmanager_secret.amc_flux_ssh_keypair.id
  secret_string = jsonencode({
    "name"            = local.amc_gitlab_deploy_key_secret_name,
    "private-key"     = tls_private_key.amc_flux.private_key_openssh,
    "public-key"      = tls_private_key.amc_flux.public_key_openssh,
    "ssh-known-hosts" = var.gitlab_ssh_known_hosts,
  })
}

data "aws_iam_policy_document" "amc_flux_ssh_keypair" {
  statement {
    sid    = "EnableAdminAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [var.human_admins_role_arn, var.tf_exec_role_arn]
    }

    actions   = ["secretsmanager:*"]
    resources = [aws_secretsmanager_secret.amc_flux_ssh_keypair.arn]
  }
}

resource "aws_secretsmanager_secret_policy" "amc_flux_ssh_keypair" {
  secret_arn = aws_secretsmanager_secret.amc_flux_ssh_keypair.arn
  policy     = data.aws_iam_policy_document.amc_flux_ssh_keypair.json
}

resource "aws_ssm_parameter" "amc_flux_ssh_keypair" {
  name  = local.amc_gitlab_deploy_key_param_path
  type  = "String"
  value = aws_secretsmanager_secret.amc_flux_ssh_keypair.arn
}
