resource "aws_iam_role" "jenkins_role" {
  name = "jenkins_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
        Action    = [
                "eks:DescribeCluster",
                "eks:ListClusters",
                "eks:DescribeNodegroup",
                "eks:DescribeFargateProfile",
                "eks:ListNodegroups"
               ]
      }
    ]
  })
}

# Attach policies to the role
resource "aws_iam_role_policy_attachment" "jenkins_ec2_policy" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "jenkins_profile" {
  name = "jenkins_role_profile"
  role = aws_iam_role.jenkins_role.name
}
