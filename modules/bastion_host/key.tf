resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion_key_${var.environment}"
  public_key = file(var.public_key)
}