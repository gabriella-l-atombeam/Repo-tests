#Example at bottom

#used to define values that want OpenTofu to display after successful "tofu apply" command
#Outputs allow you to extract information about the created infrastructure.


output "<OUTPUT_NAME>" {
  #again OUTPUT_NAME is local name to output val, eg. "instance_public_ip": public IP address of an instance,
  #"database_endpoint": connection string for a database, "load_balancer_dns": DNS name of load balancer

  value       = <EXPRESSION_TO_GET_VALUE> #required: core of output block, expression that is outputted, long list of examples separated by a few spaces: value = aws_instance.my_web_server.public_ip: "Get public_ip attribute from my_web_server EC2 instance OpenTofu created.",     value = aws_vpc.main.id: "Get id attribute from main VPC OpenTofu created.",     value = aws_s3_bucket.my_app_bucket.bucket_regional_domain_name: "Get the regional domain name for the S3 bucket named my_app_bucket."       value = aws_lb.main_app_lb.dns_name: "Get the DNS name for the load balancer named main_app_lb."
  description = "A description of what this output represents."
  sensitive   = true # Optional: Masks the value in CLI output (but not in state file)
}



#Example

output "instance_public_ip" {
  description = "The public IP address of the web server instance."
  value       = aws_instance.my_web_server.public_ip
}

output "vpc_id" {
  description = "The ID of the main VPC."
  value       = aws_vpc.main.id
}