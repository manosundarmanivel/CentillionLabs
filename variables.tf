#######vpc
variable "region" {
  type = string
  default = "ap-south-1"
}
variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type = map(any)
  default = {
    "Name" = "vpc-rp-dev-mum-01"
  }
}


####pub-sub

variable "vpc_id" {
  type = string
  default = "vpc-06f7b448c4ff418e1"
}


variable "subnet_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "subnet_name" {
  type = map(any)
  default = {
    "Name" = "pubsub-rp-dev-mum-01"
  }

}


###############api-sub
#variable "vpc_id" {
#  type = string
#}


variable "apisubnet_cidr" {
  type = string
  default = "10.0.5.0/24"
}

variable "apisubnet_name" {
  type = map(any)
  default = {
    "Name" = "apisub-rp-dev-mum-01"
  }

}

########data-sub

#variable "vpc_id" {
##  type = string
#}


variable "datasubnet_cidr" {
  type = string
  default = "10.0.2.0/23"
}

variable "datasubnet_name" {
  type = map(any)
  default = {
    "Name" = "datasub-rp-dev-mum-01"
  }

}
#############db-sub

#variable "vpc_id" {
 # type = string
#}


variable "dbsubnet_cidr" {
  type = string
  default = "10.0.4.0/26"
}

variable "dbsubnet_name" {
  type = map(any)
  default = {
    "Name" = "dbsub-rp-dev-mum-01"
  }

}

#######IGW


variable "igw_name" {
  type = map(any)
  default = {
    "Name" = "igw-rp-dev-mum-01"
  }
}

#######SG

variable "sg_name" {
  type = map(any)
  default = {
    "Name" = "rp_sg"
  }
}


########pub-s3-01(web)

variable "bucket" {
  type = string
  default = "pubs3-rp-web-mum-dev-01"
}

variable "s3_acl" {
    type = string
    default = "public-read-write"
  
}

variable "s3_name" {
    type = map(any)
    default = {
      "Name" = "pubs3-rp-web-mum-dev-01"
    }
  
}

############pub-s3-02(raw-data)
variable "bucket_raw" {
  type = string
  default = "pubs3-rp-rawdata-mum-dev-01"
}

variable "s3_acl_raw" {
    type = string
    default = "public-read-write"
  
}

variable "s3_name_raw" {
    type = map(any)
    default = {
      "Name" = "pubs3-rp-rawdata-mum-dev-01"
    }
  
}

###########prv-s3-01(datapipeline-config)

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

###############prv-s3-02 (Processed data)

variable "bucket_data" {
  type = string
  default = "prvs3-rp-data-mum-dev-01"
}

variable "s3_acl_data" {
    type = string
    default = "private"
  
}

variable "s3_name_data" {
    type = map(any)
    default = {
      "Name" = "prvs3-rp-data-mum-dev-01"
    }
  
}


/*
#############Beanstalk (web app)

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

#variable "vpc_id" {
 #   type = string
#}

variable "pub_subnet_id" {
  type = string
}

*/