output "ec2_public_ip" {
  description = "Public IP of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_ec2.public_ip
}

output "jenkins_role_arn" {
  description = "IAM role ARN for Jenkins on EC2"
  value       = aws_iam_role.jenkins_role.arn
}