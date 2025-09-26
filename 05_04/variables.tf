variable "region" {
  type = string
}
variable "amis" {
  type = map(string)
}
variable "instance_type" {
  type = string
}

variable "web_servers" {
  type = list(string)
}

variable "servers" {
  type = map(map(string))
}

