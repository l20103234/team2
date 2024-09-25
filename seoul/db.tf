# DB 서브넷 그룹
resource "aws_db_subnet_group" "db_subnet" {
  name       = "seo-subnetgroup"
  subnet_ids = [aws_subnet.db_sub_a.id, aws_subnet.db_sub_c.id]

  tags = {
    Name = "SEO-subnetgroup"
  }
}

# DB 구성
resource "aws_db_instance" "db" {
  identifier_prefix      = "seo-database"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  db_name                = "work"
  username               = "admin"
  password               = "password"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.db_security.id]

  tags = {
    Name = "SEO-db"
  }
}

# DB 서브넷 그룹
resource "aws_db_subnet_group" "dev_db_subnet" {
  name       = "dev-seo-subnetgroup"
  subnet_ids = [aws_subnet.dev_db_sub_a.id, aws_subnet.dev_db_sub_c.id]

  tags = {
    Name = "dev-SEO-subnetgroup"
  }
}

# DB 구성
resource "aws_db_instance" "dev_db" {
  identifier_prefix      = "dev-seo-database"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  db_name                = "work"
  username               = "admin"
  password               = "password"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.dev_db_subnet.name
  vpc_security_group_ids = [aws_security_group.dev_db_security.id]

  tags = {
    Name = "dev_SEO-db"
  }
}
