module "iam" {
  source              = "/home/nahla/final-project/modules/iam"
  node_group_role_name = "eks-node-group-role"
}


resource "aws_eks_cluster" "main" {
  name        = var.cluster_name
  role_arn    = module.iam.eks_cluster_role_arn

  vpc_config {
    subnet_ids  = var.private_subnet_ids
    
  }
  
 

}

resource "aws_eks_node_group" "main" {
  cluster_name          =  var.cluster_name      
  node_group_name       = "${var.cluster_name}-node-group"
  node_role_arn         = module.iam.eks_node_role_arn
  
  subnet_ids = var.public_subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
 
  depends_on = [aws_eks_cluster.main]
  
  
}
