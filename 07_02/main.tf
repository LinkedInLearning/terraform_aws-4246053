resource "aws_instance" "web_server" {
  ami                    = var.amis[var.region]
  instance_type          = var.instance_type
  tags = {
    Name = var.server_type
    Env  = var.env
    Ws   = terraform.workspace
  }
}
