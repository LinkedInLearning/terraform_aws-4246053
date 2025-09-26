variable "region" {
  type        = string
}
variable "amis" {
  type        = map(string)
}
variable "instance_type" {
  type        = string
}
variable "env" {
  type = map(string)
}
variable "instance_set" {
  type = list(string)
}

