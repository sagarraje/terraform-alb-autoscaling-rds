# Inputs / Outputs / Requirements

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| create\_monitoring\_role | n/a | `bool` | `false` | no |
| deny\_ssm\_policy\_arn | n/a | `string` | n/a | yes |
| monitoring\_role\_name | n/a | `string` | `"rds-monitoring-role"` | no |
| tags | n/a | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| rds\_monitoring\_role\_arn | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
