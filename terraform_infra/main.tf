provider "aws" {
  region = var.region
}


module "vpc" {
  source   = "/home/nahla/final-project/modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "public_subnet" {
  source              = "./modules/public_subnet"
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
  tags                = var.tags
}

module "private_subnet" {
  source               = "./modules/private_subnet"
  vpc_id               = module.vpc.vpc_id
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zone_p    = var.availability_zone_p
}

module "internet_gateway" {
  source  = "./modules/internet_getway"
  vpc_id  = module.vpc.vpc_id
  igw_name = var.igw_name
}

module "route_table" {
  source               = "./modules/route_table"
  vpc_id               = module.vpc.vpc_id
  igw_id               = module.internet_gateway.igw_id
  subnet_id            = module.public_subnet.public_subnet_ids[0]
  route_table_name = var.route_table_name
}


module "security_group" {
  source  = "./modules/security_group"
  vpc_id  = module.vpc.vpc_id
  sg_name = var.sg_name
}


module "ec2" {
  source         = "./modules/ec2"
  subnet_id      = module.public_subnet.public_subnet_ids[0]
  sg_id          = module.security_group.sg_id
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  instance_name  = var.instance_name
  key_name       = var.key_name

  
}

 module "eks" {
  source              = "./modules/eks"
  cluster_name        = var.cluster_name
  private_subnet_ids  = module.private_subnet.private_subnet_ids
  public_subnet_ids   = module.public_subnet.public_subnet_ids
  desired_size        = var.desired_size
  max_size            = var.max_size
  min_size            = var.min_size
  

}
