variable "name" {
  type        = string
  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash (alias/)"
}

variable "policy" {
  default     = null
  type        = string
  description = "A valid policy JSON document."
}

variable "description" {
  default     = "Managed by Terraform"
  type        = string
  description = "The description of the key as viewed in AWS console."
}

variable "key_usage" {
  default     = "ENCRYPT_DECRYPT"
  type        = string
  description = "Specifies the intended use of the key."
}

variable "deletion_window_in_days" {
  default     = 30
  type        = string
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days."
}

variable "is_enabled" {
  default     = true
  type        = string
  description = "Specifies whether the key is enabled."
}

variable "enable_key_rotation" {
  default     = true
  type        = string
  description = "Specifies whether key rotation is enabled."
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}
