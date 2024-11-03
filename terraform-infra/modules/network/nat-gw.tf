resource "aws_eip" "nat_eip" {
  domain = "vpc"  
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public_subnet.*.id, 0)
  tags = {
    Name = "${var.vpc_name}-nat-gw"
  }
    depends_on = [aws_internet_gateway.igw]

}
