resource "aws_db_instance" "this" {
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  engine                 = var.engine
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  db_subnet_group_name   = aws_db_subnet_group.this.id
  skip_final_snapshot    = true
  vpc_security_group_ids = var.vpc_security_group_ids
  tags                   = local.tags
}

resource "aws_db_subnet_group" "this" {
  name       = "mysql_db_subnets"
  subnet_ids = var.private_subnets
  tags = {
    Name = "My DB subnet group"
  }
}
