# Key (ssh-keygen -m PEM -f awesomekey)
resource "aws_key_pair" "key" {
  key_name   = "yoowonjongkey"
  public_key = file("yoowonjongkey.pub")
}


# Public에 Bastion Instance 생성
resource "aws_instance" "bastion" {
  ami                    = coalesce(data.aws_ami.amzlinux2.id, var.image_id)
  instance_type          = "t2.micro"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.bastion_security.id]
  subnet_id              = aws_subnet.pub_sub_c.id

  tags = {
    Name = "awesome-bastion"
  }
}

# Private에 k8s-managed Server 생성
resource "aws_instance" "k8s-managed-Server" {
  ami                    = coalesce(data.aws_ami.amzlinux2.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.private_security.id]
  subnet_id              = aws_subnet.pri_sub_a.id

  tags = {
    Name = "k8s-managed-Server"
  }
}

# Private에 k8s-efs Server 생성
resource "aws_instance" "k8s-efs-Server" {
  ami                    = coalesce(data.aws_ami.amzlinux2.id, var.image_id)
  instance_type          = "t3.medium"
  key_name               = "yoowonjongkey"
  vpc_security_group_ids = [aws_security_group.efs_security.id]
  subnet_id              = aws_subnet.pri_sub_c.id

  tags = {
    Name = "k8s-managed-Server"
  }
}

data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]
  name_regex  = "^amzn2-"

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
