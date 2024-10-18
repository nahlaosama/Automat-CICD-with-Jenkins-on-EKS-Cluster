output "cluster_id" {
  value = aws_eks_cluster.main.id
}

output "node_group_id" {
  value = aws_eks_node_group.main.id
}

