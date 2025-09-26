output "db" {
  value = [for i in var.db : upper(i)]
}

output "users" {
  value = [for name, role in var.role_users : "${name} est ${role}"] 
}
