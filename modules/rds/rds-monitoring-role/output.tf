output "rds_monitoring_role_arn" {
  value = aws_iam_role.enhanced_monitoring[0].arn
}
