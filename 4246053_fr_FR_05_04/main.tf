
resource "aws_instance" "web_server" {
  count = length(var.web_servers)
  ami                    = var.amis[var.region]
  instance_type          = var.instance_type
  tags = {
    Name = "${var.web_servers[count.index]}"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips_web.txt"
  }
}

resource "aws_instance" "servers" {
  for_each = var.servers
  ami                    = var.amis[var.region]
  instance_type          = var.instance_type
  tags = {
    Name = "${each.value.name}"
    Env  = "${each.value.env}"
  }

  provisioner "local-exec" {
    command = ( each.value.env == "dev" ? "echo ${self.public_ip} >> public_ips_dev.txt" : "echo ${self.public_ip} >> public_ips_autres.txt" )
  }
}
