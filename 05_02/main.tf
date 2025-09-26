resource "aws_instance" "web_server" {
  ami                    = var.amis[var.region]
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  key_name               = aws_key_pair.web_server_key.key_name
  tags = {
    Name = "web_server"
  }
  provisioner "remote-exec" {
    inline = [
      "apt-get -y update",
      "apt-get install -y apache2 nginx",
      "systemctl start apache2",
      "systemctl enable apache2",
      "sh -c 'echo \"Hello From Web Server Apache ....\" > /var/www/html/index.html'",
    ]
    connection {
    type        = "ssh"
    user        = "admin"
    private_key = file(var.private_key)
    host        = self.public_ip
  }
  }
  
}

resource "aws_key_pair" "web_server_key" {
  key_name   = "web_server_key"
  public_key = file(var.public_key)
}

resource "aws_security_group" "web_server_sg" {
  name = "web_server_sg"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
