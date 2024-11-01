# EKS Cluster Variables

variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  type = string
  default = "eks-demo"
}

variable "cluster_service_ipv4_cidr" {
    description = "Service IPV4 CIDR for Kubernetes Cluster"
    type = string
    default = "null"  
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for Kubernetes"
  #https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html
  type = string
  default = "null"
}

variable "cluster_endpoint_private_acess" {
  description = "Indicates whether or not EKS private API server endpoint is enabled"
  type = bool
  default = false
}

variable "cluster_endpoint_public_acess" {
  description = "Indicates whether or not EKS public API server endpoint is enabled"
  type = bool
  default = true
}

variable "cluster_endpoint_public_acess_cidrs" {
  description = "List of CIDR Blocks which can the EKS Public API Server Endpoint"
  type = list(string)
  default = [ "0.0.0.0/0" ]
}