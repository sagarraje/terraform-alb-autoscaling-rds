# Create alb
variable "create_alb" { default = false }

# Load balancer details
variable stackname { default = "" }
variable alb_detail { default = [] }

# Target group details
variable target_detail { default = [] }
variable target_groups_defaults { default = {} }

# VPC and Subnet IDs
variable vpc_id { default = "" }
variable public_subnet_ids { default = [] }
