#this is for the Provider REQUIREMENTS


#This block tells OpenTofu which cloud provider I'm using
#also its specific settings 
#  - like region
#  - and which version of their plugings should I download

# versions.tf (or main.tf)
terraform {
  #Defines settings for OpenTofu itself, can specify global configs too

  required_providers {
    #declares external providers my config depends on
    #provider are plugings that OpenTofu uses to interact w/ cloud platforms (AWS, AZURE, GCP)
    #SaaS services (Cloudflare, Datadog), or other APIs



    aws = {
      #Here we use the provider aws then define its requirements inside
      #aws is local name to provider, so I chose it

      source  = "hashicorp/aws" # The official AWS provider source
      #hashicorp is organization that publishes the official registry path for the AWS provider

      version = "~> 5.0"        # Specify a version constraint for compatibility
    }
  }
}

#each one has stylized versions of what the file name should be but I just 
#did this for clarity


