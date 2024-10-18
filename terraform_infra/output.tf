output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.public_subnet.public_subnet_ids
}

output "igw_id" {
  value = module.internet_gateway.igw_id
}

output "route_table_id" {
  value = module.route_table.route_table_id
}

output "sg_id" {
  value = module.security_group.sg_id
}

output "ec2_instance_id" {
  value = module.ec2.ec2_instance_id
}

output "public_subnet_ids" {
  value = module.public_subnet.public_subnet_ids
}

output "private_subnet_id" {
  value = module.private_subnet.private_subnet_ids
}

output "eks_cluster_name" {
  value = module.eks.cluster_id
}






