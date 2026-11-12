resource "aws_vpc" "this" {
  cidr_block = var.cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = merge(var.tags, { Name = var.name, ManagedBy = "platform-factory" })
}
resource "aws_subnet" "private" {
  for_each = { for i, az in var.availability_zones : az => i }
  vpc_id = aws_vpc.this.id
  availability_zone = each.key
  cidr_block = cidrsubnet(var.cidr, 4, each.value)
  map_public_ip_on_launch = false
  tags = merge(var.tags, { Name = "${var.name}-private-${each.key}" })
}
