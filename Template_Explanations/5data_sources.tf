#Example at bottom

#Data sources allow you to fetch information about existing infrastructure 
#that was not created by your current OpenTofu configuration, or to retrieve 
#dynamic information (like the latest AMI).

data "<PROVIDER_NAME>_<DATA_SOURCE_TYPE>" "<LOCAL_NAME>" {
  #data blocks read information about components that ALREADY exist or in other OpenTofu configs
  # used to discover IDs of existing VPC, subnet, security group or AMI
  # Dynamic AMI Selection: selects latest or specific AMI based on filters
  # Refencing External Resources: pulling details about resources managed by diff OpenTofu configs or team
  # Network Info: Getting details about Availability Zones, route tables, etc. 

  # Arguments to filter/query the data source
  # e.g., for aws_ami: most_recent, owners, filters


  #data = asking info about existing resource
  #<PROVIDER_NAME>_<DATA_SOURCE_TYPE> =
  # <PROVIDER_NAME> = provider alias I configures, e.g. aws
  # <DATA_SOURCE_TYPE> = specific type of info want to query, e.g. AMI, VPC s3_bucket



  #<LOCAL_NAME> = logical name
  #eg. "amazon_linux_2": "name of the AMI in my code I'm looking up"    "default_vpc": "The VPC I'm querying for, I'll call it 'default_vpc'."   "shared_sg": "The security group I'm trying to find, I'll call it 'shared_sg'."

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
