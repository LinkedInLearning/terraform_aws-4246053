variable "region" {
  type        = string
}
variable "amis" {
  type        = map(string)
}
variable "instance_type" {
  type        = string
}
variable "db_servers" {
  type = list(string)
}