output "<OUTPUT_NAME>" {
  value       = <EXPRESSION_TO_GET_VALUE>
  description = "A description of what this output represents."
  sensitive   = true # Optional: Masks the value in CLI output (but not in state file)
}




output "instance_public_ip" {
  description = "The public IP address of the web server instance."
  value       = aws_instance.my_web_server.public_ip
}

output "vpc_id" {
  description = "The ID of the main VPC."
  value       = aws_vpc.main.id
}