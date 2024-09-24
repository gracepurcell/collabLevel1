db-username = "admin"
db-password = "ThisIsYourDBCalling"
ami_image   = "ami-01ec84b284795cbc7" #here is the ami of london!

backend_sg_name  = "backend-allow-ssh"
frontend_sg_name = "frontend-allow-all-traffic"

backend_subnet_name  = "Backend Subnet"
frontend_subnet_name = "Frontend Subnet"

availability_zones = {
  frontend = "eu-west-2a"
  backend  = "eu-west-2b"
}                        #london azs
aws_region = "eu-west-2" #london region
