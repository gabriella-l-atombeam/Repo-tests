
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



# Example
variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr_block, 0)) # Basic CIDR validation
    error_message = "Must be a valid CIDR block."
  }
}

variable "public_subnets_cidr" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}



#how to use variables: var.<VARIABLE_NAME>

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets_cidr[count.index]
  tags = {
    Name = "public-subnet-${count.index}"
  }
}