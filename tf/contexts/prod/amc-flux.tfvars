# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

# Required: ARN for IAM role for TF
tf_exec_role_arn = "arn:aws:iam::333594256635:role/stuartellis-org-tf-exec-role"

amc_eks_cluster_identifier = "amc"

amc_flux_config = {
  flux_sync_interval      = "5m"
  kustomization_root_path = "flux/clusters"

  # Required: Versions for Flux
  flux_version      = "2.15.0"
  flux_sync_version = "1.12.0"

  # Required: URL of the GitLab repository
  git_url = "ssh://git@gitlab.com/stuartellis-org/infra/eks-auto-example.git"
  # Required: Branch in the GitLab repository
  git_branch = "main"
}
