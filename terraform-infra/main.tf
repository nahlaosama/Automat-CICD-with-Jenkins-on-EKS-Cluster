# network module
module "network" {
  source             = "./modules/network"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs

}

module "ec2" {
  source           = "./modules/ec2"
  ami_id           = var.ami_id
  subnet_id        = module.network.public_subnet_ids[0]
  instance_type    = var.instance_type
  instance_name    = var.instance_name
  sg_id            = aws_security_group.web_sg.id
  key_name         = var.key_name
}

module "eks" {
  source              = "./modules/eks"
  cluster_name        = var.cluster_name
  private_subnet_ids  = module.network.private_subnet_ids
  public_subnet_ids   = module.network.public_subnet_ids
  desired_size        = var.desired_size
  max_size            = var.max_size
  min_size            = var.min_size
  

}


