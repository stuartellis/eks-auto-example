# SPDX-FileCopyrightText: 2025-present Stuart Ellis <stuart@stuartellis.name>
#
# SPDX-License-Identifier: MIT
#

resource "kubectl_manifest" "primary_eks_automodes_nodeclass_custom01" {
  yaml_body = <<YAML
    apiVersion: eks.amazonaws.com/v1
    kind: NodeClass
    metadata:
      name: primary-custom01-class
      labels:
        provisioner: Terraform
    spec:
      ephemeralStorage:
        kmsKeyID: ${module.primary_eks_cluster.kms_key_arn} 
      role: ${module.primary_eks_cluster.node_iam_role_name}
      subnetSelectorTerms:
        - id: ${var.primary_eks_cluster_config.subnet_ids[0]}
        - id: ${var.primary_eks_cluster_config.subnet_ids[1]}
        - id: ${var.primary_eks_cluster_config.subnet_ids[2]}
      securityGroupSelectorTerms:
        - id: ${module.primary_eks_cluster.node_security_group_id}
      tags:
        Component: ${local.meta_component_name}
        Edition: ${local.meta_edition_name}
        EditionId: ${local.edition_id}
        Environment: ${local.meta_environment_name}
        Product: ${local.meta_product_name}
        Provisioner: Terraform
    YAML
}

resource "kubectl_manifest" "primary_eks_automodes_nodepool_custom01" {
  yaml_body = <<YAML
  apiVersion: karpenter.sh/v1
  kind: NodePool
  metadata:
    name: primary-custom01-amd64-pool
    labels:
      provisioner: Terraform
  spec:
    disruption:
      budgets:
        - nodes: 25%
      consolidateAfter: 30s
      consolidatePolicy: WhenEmptyOrUnderutilized
    template:
      metadata:
        labels:
          provisioner: Terraform 
      spec:
        expireAfter: 168h
        nodeClassRef:
          group: eks.amazonaws.com
          kind: NodeClass
          name: primary-custom01-class
        requirements:
          - key: "eks.amazonaws.com/instance-category"
            operator: In
            values: 
              - "c"
              - "m"
              - "r"
          - key: "eks.amazonaws.com/instance-cpu"
            operator: In
            values:
              - "4"
              - "8"
              - "16"
          - key: "kubernetes.io/arch"
            operator: In
            values: 
              - amd64
          - key: "kubernetes.io/os"
            operator: In
            values: 
              - linux
        terminationGracePeriod: 24h0m0s
  YAML
}
