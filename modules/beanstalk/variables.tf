variable "elb_name" {
  default = "elb-rp-mum-dev-01"
}

variable "elb_env" {
  default = "elb-rp-mum-dev-01-env"
}

variable "solution_stack_name" {
  default = "64bit Amazon Linux 2 v3.4.4 running Python 3.8"
}

variable "tier" {
  default = "WebServer"
}

variable "vpc_id" {
    type = string
}

variable "public_subnets" {
  type = string
}