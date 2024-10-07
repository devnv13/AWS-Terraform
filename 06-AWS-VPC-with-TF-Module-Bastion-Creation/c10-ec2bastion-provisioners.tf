# Create a Null Resource and Provisioners
resource "null_resource" "copy_ec2_keys" {
  depends_on = [ aws_instance.ec2-bastion ]

# File Provisioner to copy terraform-key.pem file to /home/ec2-user in bastion
  provisioner "file" {
    source = "terraform-key.pem"
    destination = "/home/ec2-user/"
  }
# Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [ 
        "sudo chmod 400 /home/ec2-user/teraform-key.pem"
     ]
  }
}  