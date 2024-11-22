module "ec2_instance_1" {
  source = "./modules/ec2_instance"
  my_instance_type = "t2.micro"
  my_tags = {
      Name = "vm1"
      Env  = "prod"
  }
  my_ami = "ami-0fcc0bef51bad3cb2"
}

module "ec2_instance_2" {
  source = "./modules/ec2_instance"
}
