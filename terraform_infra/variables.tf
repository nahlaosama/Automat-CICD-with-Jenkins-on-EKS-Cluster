variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR block for the private subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Availability zones for the public subnets"
  default     = ["us-east-2a", "us-east-2b"]
}

variable "availability_zone_p" {
  description = "Availability zone for the private subnet"
  default     = ["us-east-2a", "us-east-2b"]
}

variable "vpc_name" {
  default = "main-vpc"
}


variable "igw_name" {
  default = "main-igw"
}

variable "subnet_name" {
  default = "public-subnet"
}

variable "route_table_name" {
  default = "public-route-table"
}

variable "sg_name" {
  default = "web-sg"
}

variable "ami_id" {
  default = "ami-0ea3c35c5c3284d82"  # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type

}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "public-ec2-instance"
}

variable "aws_region" {
  default = "us-east-2"
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {
    Environment = "Development"
    Project     = "MyProject"
  }
}


variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "my-eks-cluster"
}


variable "desired_size" {
  description = "Desired number of worker nodes"
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  default     = 1
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  default     = 1
}

variable "key_name" {
  description = "SSH key pair name"
  default ="ec2-key" # Replace with your key pair name
}


