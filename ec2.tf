
resource "aws_instance" "frontend_ec2" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]
  subnet_id                   = aws_default_subnet.frontend.id
  key_name                    = "london-key"
  associate_public_ip_address = true

  provisioner "remote-exec" {
    inline = [

      "sudo apt update",
      "sudo apt install -y nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/Desktop/london_key.pem")
      host        = self.public_ip
    }
  }
}

resource "aws_instance" "backend_ec2" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  key_name               = "london-key"
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  subnet_id              = aws_default_subnet.backend.id
}