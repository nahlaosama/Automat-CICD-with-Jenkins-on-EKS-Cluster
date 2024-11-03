resource "aws_instance" "jenkins_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  security_groups        = [var.sg_id]
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.jenkins_profile.name



 # Load the shell script content into user_data
  user_data = file("${path.module}/install_docker.sh")

  tags = {
    Name = var.instance_name
  }

}
