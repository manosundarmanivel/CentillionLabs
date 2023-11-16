variable "region" {}

variable "user_arn" {
  default ="arn:aws:iam::973713214519:user/tf_user"
}

variable key_spec {
  default = "SYMMETRIC_DEFAULT"
}

variable enabled {
  default = true
}

