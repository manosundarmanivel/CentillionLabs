variable "bucket_config" {
  type = string
  default = "prvs3-rp-config-mum-dev-01"
}

variable "s3_acl_config" {
    type = string
    default = "private"
  
}

variable "s3_name_config" {
    type = map(any)
    default = {
      "Name" = "prvs3-rp-config-mum-dev-01"
    }
  
}