output "vpc_private_sg_id" {
  value = aws_security_group.susel_sg_private.id
}

output "vpc_public_sg_id" {
  value = aws_security_group.susel_sg_public.id
}
