variable "name" {
  type = string
  validation {
    condition = can(regex("^[a-z0-9][a-z0-9._/-]{1,254}$", var.name))
    error_message = "Use a valid lower-case ECR repository name."
  }
}
variable "tags" { type = map(string); default = {} }
variable "retain_images" {
  type = number
  default = 30
  validation {
    condition = var.retain_images >= 10 && var.retain_images <= 500
    error_message = "Retention must be between 10 and 500."
  }
}
