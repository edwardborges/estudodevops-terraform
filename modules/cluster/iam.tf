resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.project_name}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-cluster-role"
    }
  )
}

resource "aws_iam_policy_attachment" "eks_cluster_role_attachment" {
  name       = "${var.project_name}-cluster-policy-attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

  roles = [aws_iam_role.eks_cluster_role.name] # pesquisando chatgpt ele deu essa informacao sempre exige um destes campos role,users,groups
}
