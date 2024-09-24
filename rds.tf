resource "aws_db_instance" "my_rds" {
  allocated_storage      = 10
  db_name                = "collabdb"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = var.db-username
  password               = var.db-password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db_sec_group.id]
  #db_subnet_group_name   = aws_db_subnet_group.default_sg.name
  publicly_accessible    = false
}

# RDS Subnet Group 
/**resource "aws_db_subnet_group" "default_sg" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet_ids.subnets_ids.ids]

  tags = {
    Name = "DB Subnet Group"
  }
}*/


resource "aws_security_group" "db_sec_group" {
  name        = "allow_mySQL"
  description = "Allow MySQL to backend ec2"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_default_subnet.backend.cidr_block] #need to fix
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}