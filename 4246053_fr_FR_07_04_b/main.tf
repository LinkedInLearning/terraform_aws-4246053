resource "aws_instance" "my_ec2" {
 ami = var.amis[var.region]
  instance_type = var.instance_type
  tags = {
      Name = "${terraform.workspace == "prod" ? "prod-ec2" : "default-ec2"}"
      Env = "dev"
      Project = "project_one"
  }
}
