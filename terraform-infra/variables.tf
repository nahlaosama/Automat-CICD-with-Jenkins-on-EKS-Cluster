variable "aws_region" {
    description = "The region where the infrastructure should be deployed to"
    type = string
}

variable "vpc_name" {
  description = "VPC Name for Jenkins Server VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR for Jenkins Server VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
}

variable "public_subnet_count" {
  description = "Number of public subnets."
  type        = number
}

variable "private_subnet_count" {
  description = "Number of private subnets."
  type        = number
}

variable "azs" {
  description = "Availability zones for subnets."
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}


variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  default ="ec2-key" # Replace with your key pair name
}

variable "sg_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "my_sg"
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


