variable "environment" {}
variable "short_region_name" {}
variable "aws_region" {}
variable "instance_type" {}
variable "vpc_sg" {}
variable "sub_pub" {}

variable "public_key" {
  default = "~/.ssh/bastion_key_dev.pub"
}

variable "private_key" {
  default = "~/.ssh/bastion_key_dev"
}

variable "amis" {
  type = map(string)
  default = {
    ap-south-1 = "ami-02a2af70a66af6dfb"
  }
}
