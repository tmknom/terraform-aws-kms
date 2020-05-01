# terraform-aws-kms

[![Terraform Actions Status](https://github.com/tmknom/terraform-aws-kms/workflows/Terraform/badge.svg)](https://github.com/tmknom/terraform-aws-kms/actions?query=workflow%3ATerraform)
[![Markdown Actions Status](https://github.com/tmknom/terraform-aws-kms/workflows/Markdown/badge.svg)](https://github.com/tmknom/terraform-aws-kms/actions?query=workflow%3AMarkdown)
[![YAML Actions Status](https://github.com/tmknom/terraform-aws-kms/workflows/YAML/badge.svg)](https://github.com/tmknom/terraform-aws-kms/actions?query=workflow%3AYAML)
[![JSON Actions Status](https://github.com/tmknom/terraform-aws-kms/workflows/JSON/badge.svg)](https://github.com/tmknom/terraform-aws-kms/actions?query=workflow%3AJSON)
[![GitHub tag](https://img.shields.io/github/tag/tmknom/terraform-aws-kms.svg)](https://registry.terraform.io/modules/tmknom/kms/aws)
[![License](https://img.shields.io/github/license/tmknom/terraform-aws-kms.svg)](https://opensource.org/licenses/Apache-2.0)

Terraform module which creates KMS resources on AWS.

## Description

Provision [KMS Key](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html) and
[KMS Alias](https://docs.aws.amazon.com/kms/latest/developerguide/programming-aliases.html).

This module provides recommended settings:

- Enable key rotation
- Maximum deletion window

## Usage

### Minimal

```hcl
module "kms" {
  source = "git::https://github.com/tmknom/terraform-aws-kms.git?ref=tags/2.0.0"
  name   = "example"
}
```

### Complete

```hcl
module "kms" {
  source = "git::https://github.com/tmknom/terraform-aws-kms.git?ref=tags/2.0.0"
  name   = "example"

  policy                  = "${var.policy}"
  is_enabled              = true
  description             = "This is example"
  key_usage               = "ENCRYPT_DECRYPT"
  deletion_window_in_days = 14
  enable_key_rotation     = true

  tags = {
    Environment = "prod"
  }
}
```

## Examples

- [Minimal](https://github.com/tmknom/terraform-aws-kms/tree/master/examples/minimal)
- [Complete](https://github.com/tmknom/terraform-aws-kms/tree/master/examples/complete)

## Requirements

| Name      | Version |
| --------- | ------- |
| terraform | >= 0.12 |

## Providers

| Name | Version |
| ---- | ------- |
| aws  | n/a     |

## Inputs

| Name                    | Description                                                                                                       | Type          | Default                  | Required |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------- | ------------- | ------------------------ | :------: |
| name                    | The display name of the alias. The name must start with the word `alias` followed by a forward slash (alias/)     | `string`      | n/a                      |   yes    |
| deletion_window_in_days | Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. | `string`      | `30`                     |    no    |
| description             | The description of the key as viewed in AWS console.                                                              | `string`      | `"Managed by Terraform"` |    no    |
| enable_key_rotation     | Specifies whether key rotation is enabled.                                                                        | `string`      | `true`                   |    no    |
| is_enabled              | Specifies whether the key is enabled.                                                                             | `string`      | `true`                   |    no    |
| key_usage               | Specifies the intended use of the key.                                                                            | `string`      | `"ENCRYPT_DECRYPT"`      |    no    |
| policy                  | A valid policy JSON document.                                                                                     | `string`      | `null`                   |    no    |
| tags                    | A mapping of tags to assign to all resources.                                                                     | `map(string)` | `{}`                     |    no    |

## Outputs

| Name                     | Description                                                  |
| ------------------------ | ------------------------------------------------------------ |
| kms_alias_arn            | The Amazon Resource Name (ARN) of the key alias.             |
| kms_alias_target_key_arn | The Amazon Resource Name (ARN) of the target key identifier. |
| kms_key_arn              | The Amazon Resource Name (ARN) of the key.                   |
| kms_key_id               | The globally unique identifier for the key.                  |

## Development

### Development Requirements

- [Docker](https://www.docker.com/)

### Configure environment variables

```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=ap-northeast-1
```

### Installation

```shell
git clone git@github.com:tmknom/terraform-aws-kms.git
cd terraform-aws-kms
make install
```

### Makefile targets

```text
apply-complete                 Run terraform apply examples/complete
apply-minimal                  Run terraform apply examples/minimal
check-format                   Check format code
clean                          Clean .terraform
destroy-complete               Run terraform destroy examples/complete
destroy-minimal                Run terraform destroy examples/minimal
diff                           Word diff
docs                           Generate docs
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
plan-complete                  Run terraform plan examples/complete
plan-minimal                   Run terraform plan examples/minimal
release                        Release GitHub and Terraform Module Registry
upgrade                        Upgrade makefile
```

### Releasing new versions

Bump VERSION file, and run `make release`.

### Terraform Module Registry

- <https://registry.terraform.io/modules/tmknom/kms/aws>

## License

Apache 2 Licensed. See LICENSE for full details.
