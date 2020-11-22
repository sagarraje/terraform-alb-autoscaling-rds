output "lb" {
  value = {
    for lb in aws_lb.this :
    lb.id => lb.id
  }
}

output "target" {
  value = {
    for target in aws_lb_target_group.this :
    target.name => target.arn
  }
}
