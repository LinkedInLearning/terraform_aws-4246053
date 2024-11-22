
variable "region" {
  type        = string
  default     = "eu-west-1"
}
variable "amis" {
  type        = map(string)
}
variable "instance_type" {
  type        = string
}
