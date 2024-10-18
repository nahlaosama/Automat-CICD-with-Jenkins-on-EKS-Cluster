resource "aws_internet_gateway" "main_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.igw_name
  }
}
