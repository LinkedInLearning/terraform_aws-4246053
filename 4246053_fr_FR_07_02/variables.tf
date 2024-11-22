variable "region" {
  type = string
}
variable "amis" {
  type = map(string)
}
variable "instance_type" {
  type = string
}
variable "env" {
  type = string
}
variable "server_type" {
  type = string
}
