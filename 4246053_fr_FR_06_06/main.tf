module "security-group" {
  source = "terraform-aws-modules/security-group/aws"
  name   = "sg_web"
  egress_with_cidr_blocks = [
    {
      from_port   = "0"
      to_port     = "0"
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = "22"
      to_port     = "22"
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    },

  ]
}
module "ec2_instance_1" {
  source = "./modules/ec2_instance"
  my_instance_type = "t2.micro"
  my_tags = {
      Name = "vm1"
      Env  = "prod"
  }
  my_ami = "ami-0d31449d0dd5f363f"
  my_security_groups = [module.security-group.security_group_name]
  my_key_name = aws_key_pair.server-key.key_name
}
module "ec2_instance_2" {
  source = "./modules/ec2_instance"
  my_security_groups = [module.security-group.security_group_name]
  my_key_name = aws_key_pair.server-key.key_name
}
resource "aws_key_pair" "server-key" {
key_name   = "server-key"
public_key = file(var.public_key)
}

