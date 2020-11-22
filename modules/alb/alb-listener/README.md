# Inputs / Outputs / Requirements

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| alb\_arn | n/a | `map` | `{}` | no |
| certificate\_arn | n/a | `string` | `""` | no |
| create\_alb | Create nlb | `bool` | `false` | no |
| listener\_detail | n/a | `list` | `[]` | no |
| nocert\_listener\_detail | n/a | `list` | `[]` | no |
| stackname | Listener details | `string` | `""` | no |
| target\_arn | n/a | `map` | `{}` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
