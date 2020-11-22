variable monitoring_role_name   {default = "rds-monitoring-role"}
variable tags                   {default = {}}
variable create_monitoring_role {default = false}
variable deny_ssm_policy_arn    {type = string}
