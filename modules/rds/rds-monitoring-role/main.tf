data "aws_iam_policy_document" enhanced_monitoring {
  count = var.create_monitoring_role == true ? 1 : 0
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" enhanced_monitoring {
  count              = var.create_monitoring_role == true ? 1 : 0
  name               = var.monitoring_role_name
  assume_role_policy = data.aws_iam_policy_document.enhanced_monitoring[0].json
  tags = merge(
    {
      "Name" = format("%s", var.monitoring_role_name)
    },
    var.tags,
  )
}

resource "aws_iam_role_policy_attachment" enhanced_monitoring {
  count      = var.create_monitoring_role == true ? 1 : 0
  role       = aws_iam_role.enhanced_monitoring[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

resource "aws_iam_role_policy_attachment" attach_deny_ssm {
  count      = var.create_monitoring_role == true ? 1 : 0
  role       = aws_iam_role.enhanced_monitoring[0].name
  policy_arn = var.deny_ssm_policy_arn
}
