module "alb_target" {
  source            = "./modules/alb/alb-target"
  create_alb        = var.create_alb
  stackname         = var.stackname
  alb_detail        = var.alb_detail
  target_detail     = var.alb_target_detail
  vpc_id            = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
  #vpc_id            = module.vpc.vpc_id
  #public_subnet_ids = module.vpc.public_subnet_ids
}

module "alb_listener" {
  source          = "./modules/alb/alb-listener"
  create_alb      = var.create_alb
  stackname       = var.stackname
  listener_detail = [for l in var.alb_listener_detail : l if contains(values(l), "HTTPS")]
  alb_arn         = module.alb_target.lb
  target_arn      = module.alb_target.target
  certificate_arn = var.certificate_arn
}
