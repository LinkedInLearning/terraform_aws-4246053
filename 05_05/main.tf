
resource "aws_instance" "web_server" {
  count = length(var.web_servers)
  ami                    = var.amis[var.region]
  instance_type          = var.instance_type
  tags = {
    Name = "${var.web_servers[count.index]}"
  }

  provisioner "local-exec" {
    on_failure  = continue
    command = "echo ${self.public_ip} >> public_ips_web.txt"
  }

  provisioner "local-exec" {
    when        = destroy
    command = "echo ${self.public_dns} >> destroyed_machines.txt"
  }
}
