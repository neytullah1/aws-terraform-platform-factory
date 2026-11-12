package platform.terraform
import rego.v1
test_reject_mutable_ecr if {
  count(violation with input as {"resource_changes":[{"type":"aws_ecr_repository","address":"aws_ecr_repository.bad","change":{"actions":["create"],"after":{"image_tag_mutability":"MUTABLE","image_scanning_configuration":[{"scan_on_push":true}]}}}]}) == 1
}
