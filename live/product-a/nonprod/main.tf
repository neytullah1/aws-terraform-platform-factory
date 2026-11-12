module "foundation" {
  source = "../../../compositions/container-foundation" # demo only: pin registry version in production
  application = "product-a"
  environment = "nonprod"
  vpc_cidr = "10.42.0.0/16"
  availability_zones = var.availability_zones
  tags = { DataClassification = "internal", CostCenter = "engineering" }
}
output "repository_url" { value = module.foundation.repository_url }
