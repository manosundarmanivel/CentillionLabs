
resource "aws_instance" "zoro-bastion-host" {
  ami                         = var.amis[var.aws_region]
  key_name                    = aws_key_pair.bastion_key.key_name
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.vpc_sg]
  subnet_id = var.sub_pub
  associate_public_ip_address = true

  tags = {
    Name = "zoro-bastion-host-${var.environment}"
  }
}
