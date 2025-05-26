# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

data "aws_eks_cluster" "this" {
  name = local.eks_cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = local.eks_cluster_name
}

data "aws_ssm_parameter" "amc_flux_ssh_keypair" {
  name = local.gitlab_deploy_key_param_path
}

data "aws_secretsmanager_secret" "amc_flux_ssh_keypair" {
  arn = data.aws_ssm_parameter.amc_flux_ssh_keypair.value
}

data "aws_secretsmanager_secret_version" "amc_flux_ssh_keypair" {
  secret_id = data.aws_secretsmanager_secret.amc_flux_ssh_keypair.id
}
