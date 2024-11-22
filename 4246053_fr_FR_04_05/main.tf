locals {
  env = var.environment == "" ? "development" : "production"
}

resource "aws_instance" "my_ec2" {
    ami = var.amis[var.region]
    instance_type = var.environment == "prod" ? "t3.large" : "t2.micro"
    tags = {
        Name ="server-${local.env}"
    }
}
