# Create a Key Pair
provider "tls" {}
resource "tls_private_key" "pvt-key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "test-vpc-key" {
  key_name = "terraform-newkey"
  public_key = tls_private_key.pvt-key.public_key_openssh
}

provider "local" {}
resource "local_file" "key" {
  content = tls_private_key.pvt-key.private_key_pem
  filename = "private-key/terraform-newkey.pem"

  # Use local-exec provisioner to change file permissions
  provisioner "local-exec" {
    command = "chmod 400 private-key/terraform-newkey.pem"
  } 
}
