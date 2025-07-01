data "<PROVIDER_NAME>_<DATA_SOURCE_TYPE>" "<LOCAL_NAME>" {
  # Arguments to filter/query the data source
  # e.g., for aws_ami: most_recent, owners, filters
}


#Example
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Using the AMI ID from the data source
resource "aws_instance" "another_server" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  tags = {
    Name = "ServerFromDataAMI"
  }
}
