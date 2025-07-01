output "<OUTPUT_NAME>" {
  value       = <EXPRESSION_TO_GET_VALUE>
  description = "A description of what this output represents."
  sensitive   = true # Optional: Masks the value in CLI output (but not in state file)
}