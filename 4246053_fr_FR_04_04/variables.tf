variable "region" {
  type        = string
}
variable "amis" {
  type        = map(string)
}

variable "file_name" {
  type        = string
  default = "/home/user/db.txt"
}

variable "str" {
  type        = string
  default = "3"
}

variable "pass" {
  type        = string
  default = "P@ss5.rd"
}
