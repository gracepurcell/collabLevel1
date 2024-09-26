
resource "aws_instance" "frontend_ec2" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]
  subnet_id                   = aws_default_subnet.frontend.id
  key_name                    = "london_key"
  associate_public_ip_address = true
  user_data = <<-EOF
    #!bin/bash
    sudo apt update
    sudo apt install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
    echo "<html><body><h1>Hellloooooooo From Grace & Tassis Frontend VM</h1></body></html>" > /var/www/html/index.html
    EOF

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/Desktop/london_key.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "Tassi & Graces Frontend Instance"
  }
}

resource "aws_instance" "backend_ec2" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  key_name                    = "london_key"
  vpc_security_group_ids      = [aws_security_group.backend_sg.id]
  subnet_id                   = aws_default_subnet.backend.id
  associate_public_ip_address = true
  
  provisioner "remote-exec" {
    inline = [

      "sudo apt update",
      "sudo apt install -y mysql-server",
      "sudo systemctl start mysql.service"
      
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/Desktop/london_key.pem")
      host        = self.public_ip
    }
  }
}
