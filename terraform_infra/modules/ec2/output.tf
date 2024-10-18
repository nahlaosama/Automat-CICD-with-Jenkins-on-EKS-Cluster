output "ec2_instance_id" {
  value = aws_instance.web.id
}

output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}