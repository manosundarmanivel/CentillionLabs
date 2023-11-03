#Creation of Security groups
resource "aws_security_group" "sg" {
  vpc_id      = "${aws_vpc.main.id}"
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
  
  tags = {
    name  = "sg-rp-${var.short_region_name}-${var.environment}-01"
    environment = "${var.environment}"
  }
}
