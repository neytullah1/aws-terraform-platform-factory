terraform {
  required_version = ">= 1.6.0"
  required_providers { aws = { source = "hashicorp/aws", version = "~> 5.0" } }
  # Backend is configured through Scalr remote execution; no local state in production.
}
provider "aws" {
  region = var.aws_region
  default_tags { tags = { Owner = "product-a", ManagedBy = "scalr" } }
}
