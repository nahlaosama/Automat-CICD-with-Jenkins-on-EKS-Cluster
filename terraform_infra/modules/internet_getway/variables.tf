variable "vpc_id" {
  description = "VPC ID to attach the internet gateway"
}

variable "igw_name" {
  description = "Name tag for the internet gateway"
  default     = "main-igw"
}
