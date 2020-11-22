module "db_subnet_group" {
  source      = "./modules/rds/db-subnet-group"
  create      = var.create_db_subnet_group
  identifier  = var.identifier
  name_prefix = "${var.identifier}-"
  subnet_ids  = var.subnet_ids
  tags        = var.rds_tags
}

module "db_parameter_group" {
  source          = "./modules/rds/db-parameter-group"
  create          = var.create_db_parameter_group
  identifier      = var.identifier
  name            = var.parameter_group_name
  description     = var.parameter_group_description
  use_name_prefix = false
  family          = var.family
  parameters      = var.parameters
  tags            = var.rds_tags
}

module "db_option_group" {
  source                   = "./modules/rds/db-option-group"
  create                   = var.create_db_option_group
  identifier               = var.identifier
  name_prefix              = "${var.identifier}-"
  option_group_description = var.option_group_description
  engine_name              = var.engine
  major_engine_version     = var.major_engine_version
  options                  = var.options
  tags                     = var.rds_tags
}

module "db_instance" {
  source                 = "./modules/rds/db-instance"
  create                 = var.create_db_instance
  identifier             = var.identifier
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  storage_type           = var.storage_type
  storage_encrypted      = var.storage_encrypted
  name                   = var.instance_name
  username               = var.username
  password               = var.password
  port                   = var.port
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = module.db_subnet_group.this_db_subnet_group_id
  parameter_group_name   = var.parameter_group_name
  #parameter_group_name   = module.db_parameter_group.this_db_parameter_group_id
  option_group_name            = var.option_group_name
  availability_zone            = var.availability_zone
  multi_az                     = var.multi_az
  iops                         = var.iops
  publicly_accessible          = var.publicly_accessible
  allow_major_version_upgrade  = var.allow_major_version_upgrade
  auto_minor_version_upgrade   = var.auto_minor_version_upgrade
  apply_immediately            = var.apply_immediately
  maintenance_window           = var.maintenance_window
  skip_final_snapshot          = var.skip_final_snapshot
  copy_tags_to_snapshot        = var.copy_tags_to_snapshot
  final_snapshot_identifier    = var.final_snapshot_identifier
  performance_insights_enabled = var.performance_insights_enabled
  backup_retention_period      = var.backup_retention_period
  backup_window                = var.backup_window
  #monitoring_interval                 = var.monitoring_interval
  #monitoring_role_arn                 = module.rds_monitoring_role.rds_monitoring_role_arn
  #monitoring_role_name                = "${var.stackname}-${var.monitoring_role_name}"
  timezone                            = var.timezone
  character_set_name                  = var.character_set_name
  deletion_protection                 = var.deletion_protection
  tags                                = var.rds_tags
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
}
