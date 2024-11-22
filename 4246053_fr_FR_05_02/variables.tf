variable "region" {
  type = string
}
variable "amis" {
  type = map(string)
}
variable "instance_type" {
  type = string
}
variable "public_key" {
  type = string
}
variable "private_key" {
  type = string
}
