resource "aws_subnet" "pub_sub_a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.250.1.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true # public IP 자동 할당

  tags = {
    Name = "SEO-PRD-VPC-BASTION-PUB-2A"
  }
}

resource "aws_subnet" "pub_sub_c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.250.2.0/24"
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = true # Public IP 자동 할당

  tags = {
    Name = "SEO-PRD-VPC-PUB-2C"
  }
}

resource "aws_subnet" "pri_sub_a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.250.50.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = false # Public IP 자동 할당

  tags = {
    Name = "SEO-PRD-VPC-PRI-2A"
  }
}

resource "aws_subnet" "pri_sub_c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.250.51.0/24"
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = false # Public IP 자동 할당

  tags = {
    Name = "SEO-PRD-VPC-PRI-2C"
  }
}

resource "aws_subnet" "pri_efs" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.250.60.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = false # Public IP 자동 할당

  tags = {
    Name = "SEO-PRD-VPC-EFS"
  }
}

resource "aws_subnet" "mgnt_sub_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.250.11.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "SEO-mgnt-sub-2a"
  }
}

resource "aws_subnet" "mgnt_sub_c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.250.21.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "SEO-mgnt-sub-2c"
  }
}

resource "aws_subnet" "node_sub_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.250.12.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "SEO-node-sub-2a"
  }
}

resource "aws_subnet" "node_sub_c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.250.22.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "SEO-node-sub-2c"
  }
}

resource "aws_subnet" "db_sub_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.250.13.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "SEO-db-sub-2a"
  }
}

resource "aws_subnet" "db_sub_c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.250.23.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "SEO-db-sub-2c"
  }
}

