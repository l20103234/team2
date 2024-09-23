resource "aws_ecr_repository" "ecr-main" {
  name                 = "main"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "awesome-front"
  }
}

resource "aws_ecr_repository" "ecr-login" {
  name                 = "login"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "awesome-back"
  }
}

resource "aws_ecr_repository" "ecr-signup" {
  name                 = "signup"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "awesome-back"
  }
}
