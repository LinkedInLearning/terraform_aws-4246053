variable "username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "password" {
  description = "Database administrator password"
  type        = string
}

variable "region" {
  type        = string
  default     = "eu-west-1"
}
