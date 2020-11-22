# Load Balancer
resource "aws_lb" this {
  count                            = var.create_alb == true ? length(var.alb_detail) : 0
  name                             = "${var.stackname}-${lookup(var.alb_detail[count.index], "alb_name")}"
  load_balancer_type               = "application"
  internal                         = false
  subnets                          = var.public_subnet_ids
  enable_deletion_protection       = lookup(var.alb_detail[count.index], "enable_deletion_protection")
  idle_timeout                     = lookup(var.alb_detail[count.index], "idle_timeout")
  enable_cross_zone_load_balancing = lookup(var.alb_detail[count.index], "enable_cross_zone_load_balancing")
  enable_http2                     = lookup(var.alb_detail[count.index], "enable_http2")
  ip_address_type                  = lookup(var.alb_detail[count.index], "ip_address_type")
  tags                             = lookup(var.alb_detail[count.index], "tags")


  #security_groups            = []
  #access_logs {
  #  bucket  = "${aws_s3_bucket.lb_logs.bucket}"
  #  prefix  = "test-lb"
  #  enabled = true
  #}
  #timeouts {
  #  create = "${var.load_balancer_create_timeout}"
  #  delete = "${var.load_balancer_delete_timeout}"
  #  update = "${var.load_balancer_update_timeout}"
  #}
}


# Instance Target Group
resource "aws_lb_target_group" this {
  count                = var.create_alb == true ? length(var.target_detail) : 0
  name                 = "${var.stackname}-${lookup(var.target_detail[count.index], "name")}"
  port                 = lookup(var.target_detail[count.index], "port")
  protocol             = upper(lookup(var.target_detail[count.index], "protocol"))
  vpc_id               = var.vpc_id
  deregistration_delay = lookup(var.target_detail[count.index], "deregistration_delay", lookup(local.target_groups_defaults, "deregistration_delay"))
  target_type          = lookup(var.target_detail[count.index], "target_type", lookup(local.target_groups_defaults, "target_type"))
  slow_start           = lookup(var.target_detail[count.index], "slow_start", lookup(local.target_groups_defaults, "slow_start"))

  stickiness {
    type            = "lb_cookie"
    cookie_duration = lookup(var.target_detail[count.index], "cookie_duration", lookup(local.target_groups_defaults, "cookie_duration"))
    enabled         = lookup(var.target_detail[count.index], "stickiness_enabled", lookup(local.target_groups_defaults, "stickiness_enabled"))
  }

  health_check {
    interval            = lookup(var.target_detail[count.index], "health_check_interval", lookup(local.target_groups_defaults, "health_check_interval"))
    path                = lookup(var.target_detail[count.index], "health_check_path", lookup(local.target_groups_defaults, "health_check_path"))
    port                = lookup(var.target_detail[count.index], "health_check_port", lookup(local.target_groups_defaults, "health_check_port"))
    healthy_threshold   = lookup(var.target_detail[count.index], "health_check_healthy_threshold", lookup(local.target_groups_defaults, "health_check_healthy_threshold"))
    unhealthy_threshold = lookup(var.target_detail[count.index], "health_check_unhealthy_threshold", lookup(local.target_groups_defaults, "health_check_unhealthy_threshold"))
    timeout             = lookup(var.target_detail[count.index], "health_check_timeout", lookup(local.target_groups_defaults, "health_check_timeout"))
    protocol            = upper(lookup(var.target_detail[count.index], "healthcheck_protocol", lookup(var.target_detail[count.index], "protocol")))
    matcher             = lookup(var.target_detail[count.index], "health_check_matcher", lookup(local.target_groups_defaults, "health_check_matcher"))
  }
  tags       = lookup(var.target_detail[count.index], "tags")
  depends_on = ["aws_lb.this"]
}
