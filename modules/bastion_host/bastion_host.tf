module "network" {
    source = "../network"
   
    environment       = "${var.environment}"
    short_region_name = "${var.short_region_name}"
}

resource "aws_instance" "zoro-bastion-host" {
  ami                         = var.amis[var.aws_region]
  key_name                    = aws_key_pair.bastion_key.key_name
  instance_type               = var.instance_type
  vpc_security_group_ids      = [module.network.sg-id]
  subnet_id = module.network.public-a-subnet-id
  associate_public_ip_address = true

  tags = {
    Name = "zoro-bastion-host-${var.environment}"
  }
}
