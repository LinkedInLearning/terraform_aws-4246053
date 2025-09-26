output "public_ip_1" {
    value = [aws_instance.web_server_1.public_ip]
}
output "public_ip_2" {
    value = [aws_instance.web_server_2.public_ip]
}
