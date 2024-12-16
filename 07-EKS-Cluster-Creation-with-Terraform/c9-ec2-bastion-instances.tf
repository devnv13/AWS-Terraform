# About for_each Meta Arguments
# https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

# About aws_availability_zones
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones


# Create EC2 Bastion Instance in Public Subnet
resource "aws_instance" "ec2-bastion" {
  ami = data.aws_ami.amzlinux.id
  instance_type = var.instance_type
  #user_data = file("${path.module}/app1-install.sh")
  key_name = var.instnace_keypair
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
    sudo chmod +x ./kubectl
    sudo cp -pr ./kubectl /usr/local/bin/kubectl
    EOF  
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]
  tags = {
      "Name" = "${var.eks_cluster_name}-bastion" 
  }  
}
