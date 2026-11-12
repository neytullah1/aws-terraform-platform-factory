resource "aws_ecr_repository" "this" {
  name                 = var.name
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration { scan_on_push = true }
  encryption_configuration { encryption_type = "AES256" }
  tags = merge(var.tags, { ManagedBy = "platform-factory" })
}
resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name
  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Retain latest tagged images"
      selection = {
        tagStatus = "tagged"
        tagPrefixList = ["release-"]
        countType = "imageCountMoreThan"
        countNumber = var.retain_images
      }
      action = { type = "expire" }
    }]
  })
}
