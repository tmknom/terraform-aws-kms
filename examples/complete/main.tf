module "kms" {
  source = "../../"
  name   = "example"

  policy                  = "${data.aws_iam_policy_document.key_policy.json}"
  is_enabled              = true
  description             = "This is example"
  key_usage               = "ENCRYPT_DECRYPT"
  deletion_window_in_days = 14
  enable_key_rotation     = true

  tags = {
    Environment = "prod"
  }
}

data "aws_iam_policy_document" "key_policy" {
  policy_id = "key-default-1"

  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions = [
      "kms:*",
    ]

    resources = ["*"]
  }
}

data "aws_caller_identity" "current" {}
