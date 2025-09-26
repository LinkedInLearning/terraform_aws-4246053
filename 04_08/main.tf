
resource "aws_instance" "vm" {
  for_each = toset(var.instance_set)
  
  ami = var.amis[var.region]
  instance_type = var.instance_type

  tags = {
    Name = each.value
    Env = each.key
  }
}

resource "aws_instance" "ec2" {
  for_each = var.env

  ami = var.amis[var.region]
  instance_type = var.instance_type
  tags = {
    Name = "${each.key}"
    Env  = "${each.value}"
  }
}