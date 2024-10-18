resource "aws_subnet" "private_subnet" {
  vpc_id                  = var.vpc_id
  count                   = length(var.private_subnet_cidrs)
  cidr_block              = element(var.private_subnet_cidrs, count.index)
  availability_zone       = element(var.availability_zone_p, count.index)
  map_public_ip_on_launch = false

 
 tags = merge(
    var.tags,
    {
      Name = "PraivateSubnet-${count.index + 1}"
    }
  )

}


