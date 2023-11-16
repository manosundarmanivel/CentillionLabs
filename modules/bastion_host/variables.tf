variable "environment" {}
variable "short_region_name" {}
variable "aws_region" {}
variable "instance_type" {}


variable "public_key" {
  default = "~/.ssh/bastion_key_devgi.pub"
}

variable "amis" {
  type = map(string)
  default = {
    ap-south-1 = "ami-02a2af70a66af6dfb"
  }
}