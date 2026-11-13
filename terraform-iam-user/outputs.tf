output "iam_user_name" {
  description = "Created IAM user name"
  value       = aws_iam_user.developer.name
}

output "iam_user_arn" {
  description = "Created IAM user ARN"
  value       = aws_iam_user.developer.arn
}

output "iam_group_name" {
  description = "IAM group name"
  value       = aws_iam_group.developers.name
}

output "iam_policy_arn" {
  description = "Custom IAM policy ARN"
  value       = aws_iam_policy.s3_read_only.arn
}
