# ------------------------- #
# Serge AWS Instance
# ------------------------- #
# Serge instance
resource "aws_instance" "serge_instance" {
  # Add number of instances
  count                       = var.cloud_provider == "aws" ? 1 : 0
  # Add image type
  ami                         = var.aws_image_serge
  # Add instances type
  instance_type               = var.aws_instance_type
  # Add key name
  key_name                    = var.aws_key_name
  # Add public ip
  associate_public_ip_address = true
  # Add cloud-init
  user_data                   = file("user-data/serge-${var.cloud_distro}.yml")
  # EBS Volume
  ebs_block_device {
    device_name           = "/dev/sda"
    volume_type           = "gp2"
    volume_size           = var.aws_instance_volume_size
    delete_on_termination = true
  }
  # Add security group
  vpc_security_group_ids      = [aws_security_group.serge_security_group.id]
  # Add tags
  tags = {
      Name                    = var.aws_name
      Environment             = "${var.aws_name} instance"
      OS                      = var.aws_image_serge
  }
}

# Resource block for the security group
resource "aws_security_group" "serge_security_group" {
  name        = "serge_security_group"
  description = "Security group for Serge"
  vpc_id      = aws_vpc.serge_vpc.id
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 8008
    to_port     = 8008
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

