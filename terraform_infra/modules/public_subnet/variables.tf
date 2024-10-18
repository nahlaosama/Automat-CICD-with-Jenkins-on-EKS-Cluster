variable "vpc_id" {
  description = "The ID of the VPC where the public subnets will be created"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for the public subnets"
  type        = list(string)
}

variable "subnet_count" {
  description = "Number of public subnets to create"
  default     = 2
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {
    Environment = "dev"
    Project     = "MyProject"
  }
}

