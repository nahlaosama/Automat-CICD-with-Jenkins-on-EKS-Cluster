resource "aws_eks_cluster" "main" {
  name        = var.cluster_name
  role_arn    = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids  = var.private_subnet_ids
    
  }
  
 

}

resource "aws_eks_node_group" "main" {
  cluster_name          =  var.cluster_name      
  node_group_name       = "${var.cluster_name}-node-group"
  node_role_arn         = aws_iam_role.eks_node_role.arn
  
  subnet_ids = var.public_subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  
  instance_types = ["t2.small"]

  depends_on = [aws_eks_cluster.main]
  
  
}
