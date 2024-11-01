# AWS Availablity Zones Datasource
data "aws_availability_zones" "available" {

}

# Create VPC Using Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

# VPC Basic Details
  name              = "${var.eks_cluster_name}-vpc"
  cidr              = var.vpc_cidr_block
  #azs               = var.vpc_availability_zones
  azs               = data.aws_availability_zones.available.names
  public_subnets    = var.vpc_pubic_subnets
  private_subnets   = var.vpc_private_subnets

# NAT Gateway for Outbound Communication
  enable_nat_gateway = var.vpc_enable_nat_gateway

# VPC DNS Parameters
  enable_dns_hostnames  = true
  enable_dns_support    = true

# Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/{var.eks_cluster_name}" = "shared"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/{var.eks_cluster_name}" = "shared"    
  }

# Instances launched into the Public subnet should be assigned a public IP address.
  map_public_ip_on_launch = true   
}
