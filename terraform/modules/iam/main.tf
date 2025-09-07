resource "aws_iam_user" "eks_admin" {
  name = var.iam_username
}

resource "aws_iam_role" "eks_admin_role" {
  name = "${var.iam_username}-eks-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_user.eks_admin.arn
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_admin_policy" {
  role       = aws_iam_role.eks_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "eks_admin_key" {
  user = aws_iam_user.eks_admin.name
}

output "eks_admin_user_arn" {
  value = aws_iam_user.eks_admin.arn
}

output "eks_admin_role_arn" {
  value = aws_iam_role.eks_admin_role.arn
}
