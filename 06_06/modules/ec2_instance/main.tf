resource "aws_instance" "web_server" {
  ami = var.my_ami
  instance_type = var.my_instance_type
  tags = var.my_tags
  key_name = var.my_key_name
  security_groups = var.my_security_groups
  user_data = <<-EOF
  #!/bin/bash
  sudo apt-get update
  sudo apt-get install -y apache2
  sudo systemctl start apache2
  sudo systemctl enable apache2
  sudo echo "<h1>Hello From Terraform</h1>" > /var/www/html/index.html
  EOF
}
