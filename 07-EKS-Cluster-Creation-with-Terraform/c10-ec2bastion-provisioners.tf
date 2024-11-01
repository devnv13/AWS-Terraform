# Create a Null Resource and Provisioners
resource "null_resource" "copy_ec2_keys" {
  depends_on = [ aws_instance.ec2-bastion, local_file.key ]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type = "ssh"
    host = aws_instance.ec2-bastion.public_ip
    user = "ec2-user"
    password = ""
    private_key = tls_private_key.pvt-key.private_key_pem
  }

# File Provisioner to copy terraform-key.pem file to /home/ec2-user in bastion
  provisioner "file" {
    source = "private-key/terraform-newkey.pem"
    destination = "/home/ec2-user/terraform-newkey.pem"
  }
# Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [ 
        "sudo chmod 400 /home/ec2-user/terraform-newkey.pem"
     ]
  }
}