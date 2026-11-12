variable "name" { type = string }
variable "cidr" {
  type = string
  validation {
    condition = can(cidrnetmask(var.cidr)) && tonumber(split("/", var.cidr)[1]) >= 16 && tonumber(split("/", var.cidr)[1]) <= 24
    error_message = "Use a VPC IPv4 CIDR between /16 and /24."
  }
}
variable "availability_zones" {
  type = list(string)
  validation {
    condition = length(var.availability_zones) >= 2 && length(distinct(var.availability_zones)) == length(var.availability_zones)
    error_message = "Provide at least two distinct availability zones."
  }
}
variable "tags" { type = map(string); default = {} }
