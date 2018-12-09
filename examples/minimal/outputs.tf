output "kms_key_arn" {
  value = "${module.kms.kms_key_arn}"
}

output "kms_key_id" {
  value = "${module.kms.kms_key_id}"
}

output "kms_alias_arn" {
  value = "${module.kms.kms_alias_arn}"
}

output "kms_alias_target_key_arn" {
  value = "${module.kms.kms_alias_target_key_arn}"
}
