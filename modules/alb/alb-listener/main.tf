# Listener (with certificate)
resource "aws_lb_listener" "this" {
  count             = var.create_alb == true ? length(var.listener_detail) : 0
  load_balancer_arn = lookup(var.alb_arn, format("%s-%s", var.stackname, lookup(var.listener_detail[count.index], "alb_name")))
  port              = lookup(var.listener_detail[count.index], "port")
  protocol          = lookup(var.listener_detail[count.index], "protocol")
  certificate_arn   = var.certificate_arn
  default_action {
    type             = "forward"
    target_group_arn = lookup(var.target_arn, format("%s-%s", var.stackname, lookup(var.listener_detail[count.index], "target_name")))
  }
}
