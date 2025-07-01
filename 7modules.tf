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