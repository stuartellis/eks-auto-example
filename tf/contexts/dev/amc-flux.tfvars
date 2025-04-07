# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

# ARN of AWS role for TF
tf_exec_role_arn = "arn:aws:iam::333594256635:role/stuartellis-org-tf-exec-role"

flux_config = {
  flux_version            = "2.15.0"
  flux_sync_version       = "1.12.0"
  git_branch              = "main"
  git_url                 = "ssh://git@github.com/stuartellis/eks-auto-example.git"
  kustomization_root_path = "clusters"
  ssh_known_hosts         = "github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg="
  sync_interval           = "5m"
}
