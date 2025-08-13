# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

data "aws_iam_policy_document" "primary_eks_nodes_kms" {
  statement {
    sid = "nodeskms"

    actions = [
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:Encrypt",
      "kms:DescribeKey",
      "kms:Decrypt",
      "kms:CreateGrant",
      "kms:DescribeKey",
      "kms:GenerateDataKeyWithoutPlainText",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "primary_eks_nodes_kms" {
  name   = "${local.primary_eks_cluster_name}-nodes-kms"
  path   = "/"
  policy = data.aws_iam_policy_document.primary_eks_nodes_kms.json
}
