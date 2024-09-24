provider "aws" {
  region = var.aws_region
}

resource "aws_default_vpc" "vpc" {
  instance_tenancy = "default"
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_instance" "frontend_ec2" {
    ami = var.ami_image
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.frontend_sg.id]
    subnet_id = aws_default_subnet.frontend.id
    key_name = "london-key"
}

resource "aws_default_subnet" "frontend" {
    availability_zone = var.availability_zones["frontend"]
    tags = {
        Name = var.frontend_subnet_name
    }
}
resource "aws_default_subnet" "backend" {
    availability_zone = var.availability_zones["backend"]
    tags = {
        Name = var.backend_subnet_name
    }
}

resource "aws_instance" "backend_ec2" {
    ami = var.ami_image
    instance_type = var.instance_type
    key_name = "london-key"
    vpc_security_group_ids = [aws_security_group.backend_sg.id]
    subnet_id = aws_default_subnet.backend.id
}

resource "aws_security_group" "frontend_sg" {
    name = var.frontend_sg_name
}

resource "aws_security_group" "backend_sg" {
    name = var.backend_sg_name
}