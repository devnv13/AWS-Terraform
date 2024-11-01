# VPC Output Values

# VPC ID
output "vpc_id" {
  description   = "The ID VPC"
  value         = module.vpc.vpc_id
}

# VPC CIDR Block
output "vpc_cidr_block" {
  description   = "The CIDR Block of VPC"
  value         = module.vpc.vpc_cidr_block
}

# VPC Public Subnets
output "public_subnets" {
  description   = "List of IDs of public subnets"
  value         = module.vpc.public_subnets
}

# VPC Private Subnets
output "private_subnets" {
  description   = "List of IDs of private subnets"
  value         = module.vpc.private_subnets
}

# VPC AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.azs
}

# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}


