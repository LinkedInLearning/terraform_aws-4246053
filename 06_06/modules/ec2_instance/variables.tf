variable "my_instance_type" {
  description = "Instance Type"
  type = string
  default = "t2.micro"
}
variable "my_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {
    Name = "web_server"
    Env  = "dev"
  }
}
variable "my_ami" {
  description = "Id of the machine image"
  type = string
  default = "ami-0d31449d0dd5f363f"
  validation {
    condition     = length(var.my_ami) > 4 && substr(var.my_ami, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
 variable "my_key_name" {

 }
 variable "my_security_groups" {

 }
