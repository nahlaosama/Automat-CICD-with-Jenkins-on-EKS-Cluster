resource "aws_iam_role" "jenkins_role" {
  name = "jenkins_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "custom_deployment_policy" {
  name        = "custom_deployment_policy"
  description = "Policy to allow deployments and EKS operations"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:DescribeNodegroup",
          "eks:DescribeFargateProfile"
        ]
        Resource = "*"
      }
    ]
  })
}



# Attach policies to the role

resource "aws_iam_role_policy_attachment" "jenkins_eks_policy" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "custom_policy_attachment" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = aws_iam_policy.custom_deployment_policy.arn
}

resource "aws_iam_role_policy_attachment" "jenkins_ec2_policy" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "jenkins_profile" {
  name = "jenkins_role_profile"
  role = aws_iam_role.jenkins_role.name
}
