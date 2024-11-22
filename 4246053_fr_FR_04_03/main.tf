locals {
  ports_in = [
    443,
    80,
    22
  ]
  ports_out = [
    0
  ]
}
resource "aws_vpc" "test" {
  cidr_block = "10.10.0.0/16"
}
resource "aws_instance" "my_ec2" {
    ami = var.amis[var.region]
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    tags = {
        Name ="web_server"
    }
}
resource "aws_security_group" "web_sg" {
    name = "web-sg"
   
    dynamic "egress" {
      for_each = toset(local.ports_out)
      content {
        from_port        = egress.value
        to_port          = egress.value
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
      }
    }
    dynamic "ingress" {
      for_each = toset(local.ports_in)
      content {
        from_port        = ingress.value
        to_port          = ingress.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
      }
    }
  
}