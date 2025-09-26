output "file" {
  value = basename(var.file_name)
}
output "number" {
  value = tonumber(var.str)
}
output "password" {
  value = sha512(var.pass)
}
output "date" {
  value = timestamp()
}
output "substr" {
  value = substr("hello world", 6, 5)
}
