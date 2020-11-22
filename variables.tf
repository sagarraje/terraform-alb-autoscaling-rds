# Index
# A) ALB
# B) RDS

variable stackname { default = "" }

#############################################
# A) ALB
variable create_alb { default = false }
variable alb_detail { default = [] }
variable alb_target_detail { default = [] }
variable alb_listener_detail { default = [] }
variable vpc_id { default = "" }
variable public_subnet_ids { default = [] }
variable certificate_arn { default = "" }

#############################################
# B) RDS
variable create_monitoring_role { default = false }

# Prerequisite is to create monitoring role.
variable monitoring_role_name { default = "" }
variable deny_ssm_policy_name { default = "" }

# Postgres RDS common parameters
variable identifier { default = "" }
variable rds_tags { default = {} }
variable family { default = "" }
variable engine { default = "" }
variable major_engine_version { default = "" }

# Postgres DB subnet group
variable create_db_subnet_group { default = false }
variable db_subnet_group_name { default = "" }
variable subnet_ids { default = [] }

# Postgres DB parameter group
variable create_db_parameter_group { default = false }
variable parameter_group_name { default = "" }
variable parameter_group_description { default = "" }
variable parameters { default = [] }

# Postgres DB option group
variable create_db_option_group { default = false }
variable option_group_name { default = "" }
variable option_group_description { default = "" }
variable options { default = [] }

# Postgres DB instance
variable create_db_instance { default = false }
variable engine_version { default = "" }
variable instance_class { default = "" }
variable allocated_storage { default = "" }
variable max_allocated_storage { default = "" }
variable storage_type { default = "" }
variable storage_encrypted { default = false }
variable instance_name { default = "" }
variable username { default = "" }
variable password { default = "" }
variable port { default = "" }
variable vpc_security_group_ids { default = [] }
variable availability_zone { default = "" }
variable multi_az { default = false }
variable iops { default = 0 }
variable publicly_accessible { default = false }
variable allow_major_version_upgrade { default = false }
variable auto_minor_version_upgrade { default = true }
variable apply_immediately { default = false }
variable maintenance_window { default = "" }
variable skip_final_snapshot { default = true }
variable copy_tags_to_snapshot { default = false }
variable final_snapshot_identifier { default = "" }
variable performance_insights_enabled { default = false }
variable backup_window { default = "" }
variable backup_retention_period { default = 1 }
variable monitoring_interval { default = 0 }
variable timezone { default = "" }
variable character_set_name { default = "" }
variable deletion_protection { default = false }
variable iam_database_authentication_enabled { default = false }
variable enabled_cloudwatch_logs_exports { default = [] }

#############################################
# B) ASG
variable create_asg { default = false }
variable create_lc { default = false }
variable image_id { default = "" }
variable instance_type { default = "" }
variable asg_security_groups { default = [] }
variable vpc_zone_identifier { default = [] }
