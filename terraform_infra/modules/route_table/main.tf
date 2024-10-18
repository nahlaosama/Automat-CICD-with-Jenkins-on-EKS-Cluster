resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.public_rt.id
}
