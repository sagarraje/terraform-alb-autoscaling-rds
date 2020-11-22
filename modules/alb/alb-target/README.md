# Inputs / Outputs / Requirements

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| alb\_detail | n/a | `list` | `[]` | no |
| create\_alb | Create alb | `bool` | `false` | no |
| create\_alb\_shield | AWS Advanced Shield Flag | `bool` | `false` | no |
| public\_subnet\_ids | n/a | `list` | `[]` | no |
| stackname | Load balancer details | `string` | `""` | no |
| target\_detail | Target group details | `list` | `[]` | no |
| target\_groups\_defaults | n/a | `map` | `{}` | no |
| vpc\_id | VPC and Subnet IDs | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| lb | n/a |
| target | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
