output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets[*].id
}

# output "db_subnet_public" {
#   value = aws_subnet.public_subnets[0].id
# }

# output "db_subnet_private" {
#   value = aws_subnet.private_subnets[1].id
# }

output "env" {
  value = var.env
}
