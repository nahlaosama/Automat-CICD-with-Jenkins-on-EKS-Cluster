resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  security_groups        = [var.sg_id]
  key_name = var.key_name


 # Load the shell script content into user_data
  user_data = file("${path.module}/install_ansible.sh")

  tags = {
    Name = var.instance_name
  }
}
