# 인증서 생성
resource "aws_acm_certificate" "cert" {
  domain_name       = "*.wonjong.shop"
  validation_method = "DNS"

  tags = {
    Name = "wonjong-cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}
