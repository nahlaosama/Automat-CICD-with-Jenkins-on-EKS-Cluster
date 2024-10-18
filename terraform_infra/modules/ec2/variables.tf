variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0c55b159cbfafe1f0"  # Example for Amazon Linux 2 in us-east-1
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Public subnet ID where the EC2 will be deployed"
}

variable "sg_id" {
  description = "Security Group ID for the EC2 instance"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  default     = "public-ec2-instance"
}

variable "key_name" {
  description = "SSH key pair name for accessing the instance"
  type        = string
}