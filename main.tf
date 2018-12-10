# Terraform module which creates KMS resources on AWS.
#
# https://docs.aws.amazon.com/kms/latest/developerguide/overview.html

# https://www.terraform.io/docs/providers/aws/r/kms_key.html
resource "aws_kms_key" "default" {
  description = "${var.description}"
  is_enabled  = "${var.is_enabled}"

  # Only symmetric encryption and decryption are supported.
  key_usage = "${var.key_usage}"

  # Key policies are the primary way to control access to customer master keys (CMKs) in AWS KMS.
  # They are not the only way to control access, but you cannot control access without them.
  # The default key policy gives the AWS account (root user) that owns the CMK full access to the CMK.
  # https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html
  policy = "${var.policy}"

  # When you enable automatic key rotation for a customer managed CMK,
  # AWS KMS generates new cryptographic material for the CMK every year.
  # AWS KMS also saves the CMK's older cryptographic material so it can be used to decrypt data that it encrypted.
  #
  # Automatic key rotation has the following benefits:
  # - The properties of the CMK, including its key ID, key ARN, region, policies, and permissions, do not change when the key is rotated.
  # - You do not need to change applications or aliases that refer to the CMK ID or ARN.
  # - After you enable key rotation, AWS KMS rotates the CMK automatically every year. You don't need to remember or schedule the update.
  #
  # https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html
  enable_key_rotation = "${var.enable_key_rotation}"

  # Because it is destructive and potentially dangerous to delete a customer master key (CMK),
  # AWS KMS enforces a waiting period. To delete a CMK in AWS KMS you schedule key deletion.
  # You can set the waiting period from a minimum of 7 days up to a maximum of 30 days.
  # https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html#deleting-keys-how-it-works
  deletion_window_in_days = "${var.deletion_window_in_days}"

  # A mapping of tags to assign to the resource.
  tags = "${var.tags}"
}

# https://www.terraform.io/docs/providers/aws/r/kms_alias.html
resource "aws_kms_alias" "default" {
  name          = "alias/${var.name}"
  target_key_id = "${aws_kms_key.default.key_id}"
}
