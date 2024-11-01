# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of instances"
  value       = aws_instance.ec2-bastion.id
}

## ec2_bastion_public_ip
output "ec2_bastion_publicip" {
  description = "Elastic IP associated to the Bastion Host"
  value       = aws_instance.ec2-bastion.public_ip
}