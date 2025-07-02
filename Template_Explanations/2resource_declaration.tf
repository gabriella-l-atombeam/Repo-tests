#example at bottom


#This is the core of OpenTofu. You define infrastructure objects as resource blocks.



#a resource is an "infrastructure object" which can represent
#a server, network, database or storage unit

#each one has their own specific properties and settings I define


resource "<PROVIDER_NAME>_<RESOURCE_TYPE>" "<LOCAL_NAME>" {
  #<PROVIDER_NAME> = provider alias you configured, or AMI, for a virtual server
  #eg. aws

  #<RESOURCE_TYPE> = specific type resource you want
  #eg. aws_instance = "I want to creat a virtual server in AWS"
  # aws_vpc = "create virutal private network in AWS"
  # aws_s3_bucket = "create storage bucket in AWS S3"
  # google_computer_instance = "create virtual server in Google Cloud Compute Engine"


  #<LOCAL_NAME> = identifier to this block of configurations so can use elsewhere in code
  #can make variables around concepts like web servers, production vpc's, app data buckets (S3 bucket)




  # Optional arguments to provide to customize this "resource" block, 
  #provider will use default values or omit configs
  #tags = key-val for metadata (for organization), 
  #security_groups = network rules controlling inbound/outbound traffic
  #key_name = SSH key pair for access

  # Nested blocks (IF APPLICABLE): for complex configs
  # e.g., for a security group, ingress/egress rules (for incoming/outgoing traffic)
  
  # dynamic "NAME" {
  #for nested blocks if have map of configurations with different permissions

  # for_each = <COLLECTION> #iterates over list, set or map
  #   content {
  #     # arguments for the dynamic block, eg. aws_security_group can open and loop thru ports for ingress
  #   }
  # }



  # Meta-arguments (optional, apply to ALL resources)
  # count = NUMBER                  # Create multiple instances of this resource
  # for_each = MAP_OR_SET           # Create multiple instances based on a map/set, eg for_each = toset(["web", "app", "db"])
  # depends_on = [RESOURCE.NAME]    # Explicitly define dependencies
  # lifecycle {                     # Custom lifecycle rules
  #   prevent_destroy = true          #preventing deletion of this resource
  #   ignore_changes  = [tags]        #ignore certain attributs of a resouce determining if need update
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


