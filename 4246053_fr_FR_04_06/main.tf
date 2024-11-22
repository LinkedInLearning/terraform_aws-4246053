resource "aws_instance" "web_server" {
  count = 2
  ami = var.amis[var.region]
  instance_type = var.instance_type
  tags = {
    Name ="Web_Server-${count.index}"
  }
}
resource "aws_instance" "db_server" {

  count = length(var.db_servers)

  ami = var.amis[var.region]
  instance_type = var.instance_type

  tags = {
    Name = "DB_Server-${count.index}"
  }
}
