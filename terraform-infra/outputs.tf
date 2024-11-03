output "vpc_id" {
  value = module.network.vpc_id
}
output "public_subnet_ids" {
  value = module.network.public_subnet_ids 
  
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids

}

output "ec2_public_ip" {
  description = "Public IP of the Jenkins EC2 instance"
  value       = module.ec2.ec2_public_ip
}

output "jenkins_role_arn" {
  description = "IAM role ARN for Jenkins on EC2"
  value       = module.ec2.jenkins_role_arn
}

output "eks_cluster_name" {
  value = module.eks.cluster_id
}