variable "region" {
  type        = string
  default     = "eu-west-1"
}
variable "amis" {
  type 	      = map(string)
}
