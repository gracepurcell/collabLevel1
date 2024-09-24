output "frontend_public_ip_address" {

  value = aws_instance.frontend_ec2.public_ip

}
output "backend_public_ip_address" {

  value = aws_instance.backend_ec2.public_ip

}
