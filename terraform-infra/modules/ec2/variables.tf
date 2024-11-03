variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "sg_id" {
  description = "Security group ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access to the EC2 instance"
  type        = string
}

