resource "aws_default_vpc" "vpc" {
  instance_tenancy = "default"
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_instance" "frontend_ec2" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]
  subnet_id                   = aws_default_subnet.frontend.id
  key_name                    = "london-key"
  associate_public_ip_address = true
}

resource "aws_default_subnet" "frontend" {
  availability_zone = var.availability_zones["frontend"]
  cidr_block        = var.frontend_cidr_block
  tags = {
    Name = var.frontend_subnet_name
  }
}
resource "aws_default_subnet" "backend" {
  availability_zone = var.availability_zones["backend"]
  cidr_block        = var.backend_cidr_block
  tags = {
    Name = var.backend_subnet_name
  }
}

resource "aws_instance" "backend_ec2" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  key_name               = "london-key"
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  subnet_id              = aws_default_subnet.backend.id
}

resource "aws_security_group" "frontend_sg" {
  name        = var.frontend_sg_name
  description = "Allow traffic on frontend"
  vpc_id      = aws_default_vpc.vpc.id

  ingress {
    description = "TLS from Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Http from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow_public_traffic"
  }

}

resource "aws_security_group" "backend_sg" {
  name        = var.backend_sg_name
  description = "Allow traffic on backend"
  vpc_id      = aws_default_vpc.vpc.id


  ingress {
    description = "TLS from Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_default_subnet.frontend.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_private_traffic"
  }
}