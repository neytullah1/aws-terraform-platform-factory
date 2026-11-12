locals {
  prefix = "${var.application}-${var.environment}"
  tags = merge(var.tags, { Application = var.application, Environment = var.environment })
}
module "network" {
  source = "../../modules/network" # replace with immutable registry version in production
  name = local.prefix
  cidr = var.vpc_cidr
  availability_zones = var.availability_zones
  tags = local.tags
}
module "ecr" {
  source = "../../modules/ecr" # replace with immutable registry version in production
  name = local.prefix
  tags = local.tags
}
