resource "aws_ecr_repository" "ecr-main" {
  name                 = "mainnginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "seo-mainnginx"
  }
}

resource "aws_ecr_repository" "ecr-maintomcat" {
  name                 = "maintomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "seo-maintomcat"
  }
}

resource "aws_ecr_repository" "ecr-login" {
  name                 = "loginnginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "seo-loginnginx"
  }
}

resource "aws_ecr_repository" "ecr-logintomcat" {
  name                 = "logintomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "seo-logintomcat"
  }
}

resource "aws_ecr_repository" "ecr-signup" {
  name                 = "signupnginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "seo-signupnginx"
  }
}

resource "aws_ecr_repository" "ecr-signuptomcat" {
  name                 = "signuptomcat"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "seo-signuptomcat"
  }
}
