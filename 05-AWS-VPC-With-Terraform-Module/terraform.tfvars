# To load variable values by default from this file and overide with values present c2-generic-variables.tf
# and c3-vpc-variables.tf files

# Generic Variables
aws_region = "us-east-1"
environment = "test"

# VPC Variables
vpc_name = "myvpc"
vpc_cidr_block = "10.0.0.0/16"
vpc_availability_zones = ["us-east-1a", "us-east-1b"]
vpc_pubic_subnets = ["10.0.1.0/24"]
vpc_private_subnets = ["10.0.2.0/24"]
vpc_enable_nat_gateway = true
