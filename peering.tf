resource "aws_vpc" "dev_vpc" {
  cidr_block           = "10.230.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "DEV-VPC"
  }
}

# VPC 피어링 생성
resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = aws_vpc.vpc.id
  peer_vpc_id   = aws_vpc.dev_vpc.id
  auto_accept   = true # 상대 VPC에서 자동으로 수락하려면 true로 설정

  tags = {
    Name = "VPC-Peering"
  }
}

# Production VPC의 라우팅 테이블 업데이트
resource "aws_route" "prod_to_dev" {
  route_table_id            = aws_vpc.vpc.default_route_table_id
  destination_cidr_block    = aws_vpc.dev_vpc.cidr_block
  vpc_peering_connection_id  = aws_vpc_peering_connection.peer.id
}

# Development VPC의 라우팅 테이블 업데이트
resource "aws_route" "dev_to_prod" {
  route_table_id            = aws_vpc.dev_vpc.default_route_table_id
  destination_cidr_block    = aws_vpc.vpc.cidr_block
  vpc_peering_connection_id  = aws_vpc_peering_connection.peer.id
}