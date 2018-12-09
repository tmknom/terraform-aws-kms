output "kms_key_arn" {
  value       = "${aws_kms_key.default.arn}"
  description = "The Amazon Resource Name (ARN) of the key."
}

output "kms_key_id" {
  value       = "${aws_kms_key.default.key_id}"
  description = "The globally unique identifier for the key."
}
