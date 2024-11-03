output "eks_cluster_role_arn" {
  description = "ARN of the EKS cluster role"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}

output "cluster_id" {
  value = aws_eks_cluster.main.id
}

output "node_group_id" {
  value = aws_eks_node_group.main.id
}

