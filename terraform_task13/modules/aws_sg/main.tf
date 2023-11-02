#-------------------------
#
# Security group
#
# Made by Denis Ananev
#
#--------------------------

resource "aws_security_group" "susel_sg_private" {
  name        = "${var.env}_private_security_group"
  description = "${var.env}_security_group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ports_open
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.vpc_cidr]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #any protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "private_${var.env}_SG"
    Owner = "Denis Ananev"
  }
}

resource "aws_security_group" "susel_sg_public" {
  name        = "${var.env}_public_security_group"
  description = "${var.env}_security_group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ports_open
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #any protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "public_${var.env}_SG"
    Owner = "Denis Ananev"
  }
}
