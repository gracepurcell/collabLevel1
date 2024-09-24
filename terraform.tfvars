db-username = "admin"
db-password = "ThisIsYourDBCalling"
ami_image   = "ami-01ec84b284795cbc7" #here is the ami of london!

frontend_cidr_block = "10.0.1.0/16"
backend_cidr_block  = "10.0.2.0/16"

backend_sg_name  = "backend-allow-ssh"
frontend_sg_name = "frontend-allow-all-traffic"

backend_subnet_name  = "Backend Subnet"
frontend_subnet_name = "Frontend Subnet"