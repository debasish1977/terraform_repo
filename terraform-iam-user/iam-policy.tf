
data "aws_iam_policy_document" "s3_read_only" {
  statement {
    sid    = "ListSpecificBucket"
    effect = "Allow"

    actions = [
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}"
    ]
  }

  statement {
    sid    = "ReadObjects"
    effect = "Allow"

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}/*"
    ]
  }
}

resource "aws_iam_policy" "s3_read_only" {
  name        = "TerraformDemoS3ReadOnly"
  description = "Read-only access to the demo S3 bucket"

  policy = data.aws_iam_policy_document.s3_read_only.json
}

resource "aws_iam_group_policy_attachment" "s3_read_only" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}
