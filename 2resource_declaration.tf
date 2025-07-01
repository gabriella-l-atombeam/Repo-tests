#This is the core of OpenTofu. You define infrastructure objects as resource blocks.



#a resource is an "infrastructure object" which can represent
#a server, network, database or storage unit

#each one has their own specific properties and settings I define


resource "<PROVIDER_NAME>_<RESOURCE_TYPE>" "<LOCAL_NAME>" {
  # Required arguments specific to the resource type
  # e.g., for an EC2 instance: *ami*, instance_type

  #the ami is around what is called the "operating system image"
  #which is (Amazon Machine Image) which is a pre configured template
  #for a virtual server



  # Optional arguments
  # e.g., tags, security_groups, key_name

  # Nested blocks (if applicable)
  # e.g., for a security group, ingress/egress rules
  # dynamic "NAME" {
  #   for_each = <COLLECTION>
  #   content {
  #     # arguments for the dynamic block
  #   }
  # }

  # Meta-arguments (optional, apply to all resources)
  # count = NUMBER                  # Create multiple instances of this resource
  # for_each = MAP_OR_SET           # Create multiple instances based on a map/set
  # depends_on = [RESOURCE.NAME]    # Explicitly define dependencies
  # lifecycle {                     # Custom lifecycle rules
  #   prevent_destroy = true
  #   ignore_changes  = [tags]
  # }
}




#Example

#the aws_instance is the provider and the resource type (instance)

#my_web_server is the the local name I had already chosen for this resource
#used for referencing within my OpenTofu code

resource "aws_instance" "my_web_server" {
  ami           = "ami-053b0d53c2792790b" # Replace with a valid AMI for your region
  instance_type = "t2.micro"


  tags = {
    Name        = "MyWebServer"
    Project     = "LearningOpenTofu"
    Environment = "Dev"
  }

  # Example of linking to another resource (a security group)
  vpc_security_group_ids = [aws_security_group.web_sg.id]
}




  #ami, instance_type, tags, vpc_security_group_ids are arguments specific to the 
  #aws_instance
  #here is a link to a list and explanations: https://search.opentofu.org/provider/opentofu/aws/latest 


