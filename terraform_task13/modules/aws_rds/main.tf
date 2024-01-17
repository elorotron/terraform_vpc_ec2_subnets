resource "aws_db_subnet_group" "rds_subnet" {
  name       = "${var.env}_database_subnets"
  subnet_ids = tolist(concat(tolist(var.private_subnet_ids), tolist(var.public_subnet_ids)))
}

resource "aws_db_instance" "remote_db" {
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet.id
  db_name                = "${var.env}_db"
  engine                 = var.engine
  engine_version         = "15.4"
  instance_class         = var.class
  multi_az = false
  username               = var.user
  password               = var.pass
  availability_zone      = var.az
  skip_final_snapshot    = true
  publicly_accessible    = true
  
 
  tags = {
    Name = "${var.env}_${var.engine}"
  }
}

