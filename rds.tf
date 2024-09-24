resource "aws_db_instance" "my_rds" {
  allocated_storage    = 10
  db_name              = "collabdb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db-username
  password             = var.db-password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

resource "aws_security_group" "db_sec_group" {
  name        = "allow_mySQL"
  description = "Allow MySQL to backend ec2"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_instance.backend_ec2.cidr_blocks]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}