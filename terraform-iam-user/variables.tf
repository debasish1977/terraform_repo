
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "terraform-admin"
}

variable "iam_user_name" {
  description = "IAM user to create"
  type        = string
  default     = "terraform-demo-user"
}

variable "iam_group_name" {
  description = "Name of the IAM group"
  type        = string
  default     = "terraform-demo-developers"
}

variable "s3_bucket_name" {
  description = "Existing S3 bucket for read-only access"
  type        = string
}
