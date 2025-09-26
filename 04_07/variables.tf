variable "region" {
  type        = string
}
variable "amis" {
  type        = map(string)
}
variable "instance_type" {
  type        = string
}

variable "db" {
  type = list(string)
  default = ["db1","db2","db3"]
}

variable "role_users" { 
  type = map(string) 
  default = {
    "Anne" = "dev" 
    "Paul" = "admin" 
    "Marie" = "manager"
  } 
}
