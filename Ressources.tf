resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh

  provisioner "local-exec" { 
    # Create "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.example.private_key_pem}' > ./ArcaneKeySSH.pem"
  }
}


resource "aws_instance" "VM_Arcane_Project" {
  ami = "${var.ami_id}" 
  count = "${var.number_of_instances}" 
  instance_type = "${var.instance_type}"
 
  tags = {
    Name = "${var.instance_name}"
  }

  ## nouvelle attributs
  
  key_name      = aws_key_pair.generated_key.key_name
}

# terraform state file setup
# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform-state-storage-s3" {
  bucket = "arcane-terraform-state-s3"
  #region = "eu-west-3"

  versioning {
    # enable with caution, makes deleting S3 buckets tricky
    enabled = false
  }
    # prevent accidental deletion
  lifecycle {
    prevent_destroy = true
  }

  #tags {
  #  name = "S3 Remote Terraform State Store"
  #  proj = "example-iac"
  #  env = "prod"
  #}
}

