output "public_ip_1" {
    value       = module.ec2_instance_1.public_ip
}
output "ec2_tags_1" {
    value       = module.ec2_instance_1.ec2_tags
}
output "public_ip_2" {
    value       = module.ec2_instance_2.public_ip
}
output "ec2_tags_2" {
    value       = module.ec2_instance_2.ec2_tags
}
