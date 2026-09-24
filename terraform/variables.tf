variable "requester" {
  type        = string
  description = "Person submitting the request."
  nullable    = false
}

variable "user_email" {
  type        = string
  description = "Internal Chipotle email address for the AVD user."
  nullable    = false

  validation {
    condition     = can(regex("^[A-Za-z0-9._%+-]+@chipotle\\.com$", var.user_email))
    error_message = "user_email must be an internal @chipotle.com address."
  }
}

variable "use_case" {
  type        = string
  description = "Use case used by the host pool decision matrix."
  nullable    = false
}

variable "applications" {
  type        = list(string)
  description = "Applications required by the user."
  nullable    = false

  validation {
    condition     = length(var.applications) > 0
    error_message = "At least one application is required."
  }
}

variable "access_duration" {
  type        = string
  description = "Whether access is temporary or permanent."
  nullable    = false

  validation {
    condition     = contains(["Temporary", "Permanent"], var.access_duration)
    error_message = "access_duration must be Temporary or Permanent."
  }
}

variable "requires_local_admin" {
  type        = bool
  description = "Whether OS-level administrator access needs a separate approval."
  nullable    = false
}

variable "host_pool_override" {
  type        = string
  description = "Optional reviewed host pool override."
  default     = ""
  nullable    = false
}
