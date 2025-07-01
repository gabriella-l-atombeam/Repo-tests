
variable "<VARIABLE_NAME>" {
  description = "A brief explanation of what this variable is for."
  type        = <TYPE> # string, number, bool, list(string), map(string), object({...})
  default     = <DEFAULT_VALUE> # Optional: If not provided, it must be set externally
  sensitive   = true # Optional: Masks the value in CLI output (but not in state file)
  validation { # Optional: Custom validation rules
    condition     = length(var.variable_name) > 0
    error_message = "Variable cannot be empty."
  }
}