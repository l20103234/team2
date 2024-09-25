# SEO 리전에 VPN Gateway 생성
resource "aws_vpn_gateway" "seo_vpn_gateway" {
  vpc_id = aws_vpc.seo-vpc.id
  tags = {
    Name = "SEO-VPN-Gateway"
  }
}

# VIR 리전에 VPN Gateway 생성
resource "aws_vpn_gateway" "vir_vpn_gateway" {
  vpc_id = aws_vpc.vir-vpc.id
  tags = {
    Name = "VIR-VPN-Gateway"
  }
}

# SEO 리전에 Customer Gateway 설정 (IP는 VIR 리전의 VPN Gateway Public IP 사용)
resource "aws_customer_gateway" "seo_customer_gateway" {
  bgp_asn    = 65000
  ip_address = "VIR_VPN_PUBLIC_IP"  # VIR 리전의 VPN Gateway Public IP 주소로 대체
  type       = "ipsec.1"
  tags = {
    Name = "SEO-Customer-Gateway"
  }
}

# VIR 리전에 Customer Gateway 설정 (IP는 SEO 리전의 VPN Gateway Public IP 사용)
resource "aws_customer_gateway" "vir_customer_gateway" {
  bgp_asn    = 65000
  ip_address = "SEO_VPN_PUBLIC_IP"  # SEO 리전의 VPN Gateway Public IP 주소로 대체
  type       = "ipsec.1"
  tags = {
    Name = "VIR-Customer-Gateway"
  }
}

# SEO 리전과 VIR 리전 간의 VPN 연결 설정
resource "aws_vpn_connection" "seo_to_vir_vpn" {
  customer_gateway_id = aws_customer_gateway.seo_customer_gateway.id
  vpn_gateway_id      = aws_vpn_gateway.vir_vpn_gateway.id
  type                = "ipsec.1"

  static_routes_only = false
  tags = {
    Name = "SEO-to-VIR-VPN"
  }
}

resource "aws_vpn_connection" "vir_to_seo_vpn" {
  customer_gateway_id = aws_customer_gateway.vir_customer_gateway.id
  vpn_gateway_id      = aws_vpn_gateway.seo_vpn_gateway.id
  type                = "ipsec.1"

  static_routes_only = false
  tags = {
    Name = "VIR-to-SEO-VPN"
  }
}