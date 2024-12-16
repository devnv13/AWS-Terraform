# Security Group for EKS Node Group - Placeholder file

# Fetch the default EKS Security Group Attached to EKS Worker Nodes

data "aws_security_group" "eks_default_sg" {
  filter {
    name = "tag:aws:eks:cluster-name"
    values = [aws_eks_cluster.eks_cluster.name]
  }

  filter {
    name = "group-name"
    values = ["eks-cluster-sg-*"]
  }
} 

# Add NodePort Rule (30000-32767) to EKS Default Security Group

resource "aws_security_group_rule" "eks_default_nodeport_ingress" {
  description = "Allow NodePort access (30000-32767) from anywhere"
  type    = "ingress"
  from_port = 30000
  to_port = 32767
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = data.aws_security_group.eks_default_sg.id

  # Ensure this runs after the EKS cluster is created
  depends_on = [ aws_eks_cluster.eks_cluster ]
}