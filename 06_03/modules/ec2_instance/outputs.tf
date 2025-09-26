output "public_ip" {
  value = aws_instance.web_server.public_ip
}
output "ec2_tags" {
  value = aws_instance.web_server.tags_all
}
