resource "aws_instance" "web_server_1" {
 ami = var.amis[var.region]
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  tags = {
    Name = "web_server"
  }
  
  user_data = <<-EOF
  #!/bin/bash
  sudo apt-get update
  sudo apt-get install -y apache2
  sudo systemctl start apache2
  sudo systemctl enable apache2
  sudo echo "<h1>Hello From Terraform Server 1</h1>" > /var/www/html/index.html
  EOF
}

resource "aws_instance" "web_server_2" {
 ami = var.amis[var.region]
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  tags = {
    Name = "web_server"
  }
  
  user_data = "${file("install_apache.sh")}"
}


resource "aws_security_group" "web_server_sg" {
    name = "web_server_sg"

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

