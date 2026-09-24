terraform {
  required_version = ">= 1.6.0"
}

locals {
  default_host_pool = (
    lower(trimspace(var.use_case)) == "miscellaneous" ||
    lower(trimspace(var.use_case)) == "vendor or contractor access"
  ) ? "cmg-contractors" : "pending-review"

  selected_host_pool = var.host_pool_override != "" ? var.host_pool_override : local.default_host_pool
}

check "host_pool_is_reviewed" {
  assert {
    condition     = local.selected_host_pool != "pending-review"
    error_message = "A host pool must be selected or explicitly overridden before deployment."
  }
}
