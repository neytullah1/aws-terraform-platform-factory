package platform.terraform
import rego.v1
# Input: Terraform JSON plan. Example policy; must run in security-owned Scalr policy gate.
violation contains msg if {
  some rc in input.resource_changes
  rc.type == "aws_ecr_repository"
  rc.change.actions != ["delete"]
  rc.change.after.image_tag_mutability != "IMMUTABLE"
  msg := sprintf("ECR must use immutable tags: %s", [rc.address])
}
violation contains msg if {
  some rc in input.resource_changes
  rc.type == "aws_ecr_repository"
  rc.change.actions != ["delete"]
  rc.change.after.image_scanning_configuration[0].scan_on_push != true
  msg := sprintf("ECR scanning must be enabled: %s", [rc.address])
}
violation contains msg if {
  some rc in input.resource_changes
  rc.type == "aws_s3_bucket_public_access_block"
  rc.change.actions != ["delete"]
  rc.change.after.block_public_acls != true
  msg := sprintf("S3 public ACLs must be blocked: %s", [rc.address])
}
