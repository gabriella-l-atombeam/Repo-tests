#This is for CONFIGURING the AWS Provider


#this is technically a different file!!
# providers.tf (or main.tf)
provider "aws" {
  #configs aws provider, called aws to match local name I made in 1_1provider_requirements.tf
  #can have multiple provider "aws" blocks if need to use diff AWS regions from same
  #OpenTofu configuration
  #if so then use aliases like: provider "aws" { alias = "west" region = "us-west-1" }


  region = "your-aws-region" # e.g., "us-east-1", "eu-west-2", 
  #where your region is, we are in **us-east-1**



  # You can also configure authentication methods here, though it's often
  # handled by environment variables (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
  # or AWS CLI configuration (~/.aws/credentials) by default.




  # Example for assuming a role (**ADVANCED**)

  # assume_role {
  #instead of direct keys, OpenTofy assumes 
  #AWS IAM role that has the necessary permissions, 
  #really is for temp, limited privilege access

  #   role_arn     = "arn:aws:iam::123456789012:role/YourOpenTofuRole"
  #123456789012 = AWS Account ID, YourOpenTofuRole = name of IAM role

  #   session_name = "OpenTofuSession"
  #session name who who assumed the role and why
  # }




  # Normal Example

  # default_tags {
  # Example for default tags to apply to all resources created by this provider:

  #   tags = {
  #below is key, value pair. Can also have things like Project = "", CostCenter = "" etc.
  
  #key = tag name, value = what the tag does (its value)
  #     ManagedBy = "OpenTofu"      #resource created and managed by OpenTofu
  #     Environment = "Development" #can be Dev, Staging, Production etc. 
  #   }
  # }
}