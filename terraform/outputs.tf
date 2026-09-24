output "request_summary" {
  description = "Values a future Nerdio or AVD assignment workflow can consume."
  value = {
    requester            = var.requester
    user_email           = var.user_email
    use_case             = var.use_case
    applications         = var.applications
    access_duration      = var.access_duration
    requires_local_admin = var.requires_local_admin
    host_pool            = local.selected_host_pool
  }
}
