# versions.tf (or main.tf)
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # The official AWS provider source
      version = "~> 5.0"        # Specify a version constraint for compatibility
    }
  }
}

#each one has stylized versions of what the file name should be but I just 
#did this for clarity






#this is technically a different file!!
# providers.tf (or main.tf)
provider "aws" {
  region = "your-aws-region" # e.g., "us-east-1", "eu-west-2"


  # You can also configure authentication methods here, though it's often
  # handled by environment variables (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
  # or AWS CLI configuration (~/.aws/credentials) by default.

  # Example for assuming a role (advanced):
  # assume_role {
  #   role_arn     = "arn:aws:iam::123456789012:role/YourOpenTofuRole"
  #   session_name = "OpenTofuSession"
  # }

  #so all resources that use this provider, AWS, has access to these default tags
  # Example for default tags to apply to all resources created by this provider:
  # default_tags {
  #   tags = {
  #     ManagedBy = "OpenTofu"
  #     Environment = "Development"
  #   }
  # }
}