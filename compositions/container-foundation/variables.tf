variable "application" { type = string }
variable "environment" {
  type = string
  validation {
    condition = contains(["nonprod", "prod"], var.environment)
    error_message = "Environment must be nonprod or prod."
  }
}
variable "vpc_cidr" { type = string }
variable "availability_zones" { type = list(string) }
variable "tags" { type = map(string); default = {} }
