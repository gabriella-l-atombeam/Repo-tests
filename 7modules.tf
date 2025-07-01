# modules/my-ec2-module/main.tf
variable "instance_name" {
  description = "Name tag for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance."
  type        = string
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}

output "instance_id" {
  description = "ID of the created EC2 instance."
  value       = aws_instance.app_server.id
}


#Example Module Call (would be main.tf)
# main.tf (in your root directory)
module "web_server_instance" {
  source = "./modules/my-ec2-module" # Path to your module directory

  instance_name = "WebServer01"
  instance_type = "t2.medium"
  ami_id        = "ami-053b0d53c2792790b" # Replace with a valid AMI
}

module "database_server_instance" {
  source = "./modules/my-ec2-module"

  instance_name = "DBServer01"
  instance_type = "t2.small"
  ami_id        = "ami-053b0d53c2792790b" # Replace with a valid AMI
}

output "web_server_id" {
  value = module.web_server_instance.instance_id
}