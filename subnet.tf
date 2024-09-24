
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

/**resource "aws_subnet_ids" "subnets_ids"{
  vpc_id = aws_default_vpc.vpc.id
}*/