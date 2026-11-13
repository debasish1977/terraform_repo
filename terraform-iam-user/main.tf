
# Create IAM User
resource "aws_iam_user" "developer" {
  name = var.iam_user_name
  path = "/developers/"

  tags = {
    Role = "Developer"
  }
}

# Create IAM Group
resource "aws_iam_group" "developers" {
  name = var.iam_group_name
  path = "/"
}

# Add IAM User to Group
resource "aws_iam_user_group_membership" "developer" {
  user = aws_iam_user.developer.name

  groups = [
    aws_iam_group.developers.name
  ]
}
