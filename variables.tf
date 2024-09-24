variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_name" {
    type = string
    default = "Our Vpc"
}

variable "ami_image" {
    type = string
    default = "ami-03cc8375791cb8bcf" # Hey Tassiana, we need your london ami code here
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "availability_zones" {
    type = map(string)
    default = {
        frontend = "eu-west-1a"
        backend = "eu-west-1b"
    }
}

variable "frontend_subnet_name" {
    type = string
    default = "Frontend Subnet"
}

variable "backend_subnet_name" {
    type = string
    default = "Backend Subnet"
}

variable "frontend_sg_name" {
    type = string
    default = "frontend-allow-all-traffic"
}

variable "backend_sg_name" {
    type = string
    default = "backend-allow-ssh"
}

variable "backend_sg_name" {
    type = string
    default = "backend-allow-ssh"
}

variable "db-username" {
  type = string
}
variable "db-password" {
  type = string
}