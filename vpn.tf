# 고객 게이트웨이 (온프레미스 라우터/파이어월의 공인 IP 필요)
resource "aws_customer_gateway" "customer_gw" {
  bgp_asn    = 65000 # BGP ASN 번호
  ip_address = "52.55.243.133" # 고객의 공인 IP 주소 (변경 필요)
  type       = "ipsec.1"

  tags = {
    Name = "Customer-Gateway"
  }
}

# VPN 게이트웨이 (AWS 측)
resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = aws_vpc.seo-vpc.id

  tags = {
    Name = "SEO-PRD-VPN-Gateway"
  }
}

# VPN 연결 생성
resource "aws_vpn_connection" "vpn_connection" {
  customer_gateway_id = aws_customer_gateway.customer_gw.id
  vpn_gateway_id      = aws_vpn_gateway.vpn_gw.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = "SEO-PRD-VPN-Connection"
  }
}

# VPN 연결 라우팅 (AWS에서 온프레미스 네트워크로 라우팅)
resource "aws_vpn_connection_route" "vpn_route" {
  vpn_connection_id = aws_vpn_connection.vpn_connection.id
  destination_cidr_block = "10.240.0.0/16" # 온프레미스 네트워크 CIDR
}

# 기존 VPC의 라우팅 테이블 업데이트
resource "aws_route_table" "main_route_table" {
  vpc_id = aws_vpc.seo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    cidr_block = "10.240.0.0/16" # 온프레미스 네트워크 CIDR
    gateway_id = aws_vpn_gateway.vpn_gw.id
  }

  tags = {
    Name = "SEO-PRD-Route-Table"
  }
}

# 서브넷과 라우팅 테이블 연결
resource "aws_route_table_association" "subnet_association" {
  subnet_id      = aws_subnet.vpn-pub_sub.id
  route_table_id = aws_route_table.main_route_table.id
}