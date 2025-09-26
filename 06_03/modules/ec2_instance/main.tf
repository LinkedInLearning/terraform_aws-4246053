resource "aws_instance" "web_server" {
  ami = var.my_ami
  instance_type = var.my_instance_type
  tags = var.my_tags
}
