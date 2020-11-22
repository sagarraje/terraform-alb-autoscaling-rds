# Index
# A) ALB
# B) RDS
# C) ASG


stackname = "dev"

#############################################
# A) ALB
create_alb        = true
vpc_id            = ""
public_subnet_ids = ["", ""]
certificate_arn   = ""
alb_detail = [
  {
    alb_name                         = "my-alb-test"
    enable_deletion_protection       = false
    idle_timeout                     = 60
    enable_cross_zone_load_balancing = false
    enable_http2                     = true
    ip_address_type                  = "ipv4"
    tags = {
      Environment = "Dev"
    }
  }
]

alb_target_detail = [
  {
    name        = "my-alb-test"
    port        = "443"
    protocol    = "HTTPS"
    target_type = "instance"
    tags = {
      Environment = "Dev"
    }
  }
]

alb_listener_detail = [
  {
    alb_name    = "my-alb-test"
    target_name = "my-alb-test"
    port        = 443
    protocol    = "Dev"
  }
]


#############################################
# B) RDS
rds_tags = {
  Environment = "test"
}
identifier           = "test-dev-db"
family               = "postgres10"
engine               = "postgres"
major_engine_version = "10"

# DB Subnet Group
create_db_subnet_group = true
subnet_ids             = ["", ""]

# DB Parameter Group
create_db_parameter_group   = true
parameter_group_name        = "test-dev-db-parameter"
parameter_group_description = "test-dev-db-parameter"
parameters = [
  {
    name         = "effective_cache_size"
    value        = "{DBInstanceClassMemory/10922}"
    apply_method = "pending-reboot"
  },
  {
    name         = "log_hostname"
    value        = "0"
    apply_method = "pending-reboot"
  },
  {
    name         = "max_replication_slots"
    value        = "5"
    apply_method = "pending-reboot"
  },
  {
    name         = "shared_buffers"
    value        = "{DBInstanceClassMemory/10922}"
    apply_method = "pending-reboot"
  },
  {
    name         = "autovacuum_naptime"
    value        = "5"
    apply_method = "pending-reboot"
  }
]

# DB Option Group
create_db_option_group   = true
option_group_description = "dev-db-options"

# DB Instance
create_db_instance = true
engine_version     = "10.7"
#db.t2.medium
instance_class                      = "db.t2.micro"
allocated_storage                   = "20"
max_allocated_storage               = "100"
storage_type                        = "gp2"
storage_encrypted                   = false
instance_name                       = "dev"
username                            = "testdb"
password                            = "password1234"
port                                = "5432"
iam_database_authentication_enabled = false
vpc_security_group_ids              = ["sg-05c4fa6549f41e861"]
maintenance_window                  = "Tue:00:00-Tue:00:30"
final_snapshot_identifier           = "test"
backup_window                       = "21:00-23:59"
#1
backup_retention_period = 0
monitoring_interval     = 30
deletion_protection     = false

#############################################
# B) ASG
create_asg          = true
create_lc           = true
image_id            = "ami-07a0da1997b55b23e"
instance_type       = "t2.micro"
asg_security_groups = [""]
vpc_zone_identifier = ["", ""]
