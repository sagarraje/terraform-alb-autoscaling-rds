# Create nlb
variable "create_alb" { default = false }

# Listener details
variable stackname { default = "" }
variable listener_detail { default = [] }
variable alb_arn { default = {} }
variable target_arn { default = {} }
variable certificate_arn { default = "" }
