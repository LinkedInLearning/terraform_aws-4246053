locals {
  environment = "development"
  key_name = "web_server"
}

resource "aws_instance" "server1" {
    ami = var.amis[var.region]
    tags = {
        Env = local.environment
    }
    instance_type = "t2.micro"
    key_name = local.key_name
}
resource "aws_instance" "server2" {
    ami = var.amis[var.region]
    tags = {
        Env = local.environment
    }
    instance_type = "t2.micro"
    key_name = local.key_name
}
