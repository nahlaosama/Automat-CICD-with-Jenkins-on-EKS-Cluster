variable "vpc_id" {
  description = "VPC ID for the route table"
}

variable "igw_id" {
  description = "Internet gateway ID for routing"
}

variable "subnet_id" {
  description = "Subnet ID to associate with the route table"
}

variable "route_table_name" {
  description = "Name tag for the route table"
  default     = "public-route-table"
}
