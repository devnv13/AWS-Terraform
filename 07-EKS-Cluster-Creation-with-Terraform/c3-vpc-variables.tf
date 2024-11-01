# VCP Name
variable "vpc_name" {
  description = "Name of the VPC"
  type = string
  default = "MyVPC"
}

# VCP CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string
  default = "10.0.0.0/16"
}

/*
# VPC Availability Zones
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}
*/

# VCP Public Subnet
variable "vpc_pubic_subnets" {
  description = "VCP Public Subnet"
  type = list(string)
  default = ["10.0.1.0/24"]
}

# VCP Private Subnet
variable "vpc_private_subnets" {
  description = "VCP Private Subnet"
  type = list(string)
  default = ["10.0.2.0/24"]
}

# Enable VPC NAT Gateway (True/Fase)
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type = bool
  default = true
}
