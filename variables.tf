variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "Our Vpc"
}

variable "ami_image" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "availability_zones" {
  type = map(string)
}

variable "frontend_subnet_name" {
  type = string
}

variable "backend_subnet_name" {
  type = string
}

variable "frontend_sg_name" {
  type = string
}

variable "backend_sg_name" {
  type = string
}

variable "db-username" {
  type = string
}
variable "db-password" {
  type = string
}

variable "frontend_cidr_block" {
  type = string
}
variable "backend_cidr_block" {
  type = string
}