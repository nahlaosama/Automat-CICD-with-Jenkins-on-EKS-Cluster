variable "vpc_id" {
  description = "The ID of the VPC where the private subnet will be created"
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "availability_zone_p" {
  description = "Availability zones for the public subnets"
  type        = list(string)
}


variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {
    Environment = "private1"
    Project     = "private2"
  }
}