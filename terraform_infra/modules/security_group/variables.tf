variable "sg_name" {
  description = "Name of the Security Group"
  default     = "web-sg"
}

variable "vpc_id" {
  description = "VPC ID to associate the security group"
}
