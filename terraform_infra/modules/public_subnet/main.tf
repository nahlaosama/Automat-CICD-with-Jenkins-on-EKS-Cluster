resource "aws_subnet" "public_subnet" {
  count                  = var.subnet_count
  vpc_id                 = var.vpc_id
  cidr_block             = element(var.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = true
  availability_zone      = element(var.availability_zones, count.index)

  tags = merge(
    var.tags,
    {
      Name = "PublicSubnet-${count.index + 1}"
    }
  )
}

