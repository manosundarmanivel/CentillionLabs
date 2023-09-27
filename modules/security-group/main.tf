terraform {
   backend "s3" {
      bucket = "rapport-terraform-tf-state"
      key = "sg-01.state"
      region = "ap-south-1"
   }
}


resource "aws_security_group" "sg" {
  vpc_id      = var.vpc_id
  name        = "allow-ssh"
  description = "security group that allows SSH and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.sg_name
}


