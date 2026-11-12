output "vpc_id" { value = aws_vpc.this.id }
output "private_subnet_ids" { value = [for k in sort(keys(aws_subnet.private)) : aws_subnet.private[k].id] }
