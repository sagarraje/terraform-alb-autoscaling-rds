//module "rds_monitoring_role" {
//  source                 = "./modules/rds/rds-monitoring-role"
//  create_monitoring_role = var.create_monitoring_role
//  monitoring_role_name   = "${var.stackname}-${var.monitoring_role_name}"
//  deny_ssm_policy_arn    = "arn:aws:iam::${var.aws_account_id}:policy/${var.deny_ssm_policy_name}"
//}
