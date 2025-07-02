

"""
The Power of Modules:

In this example, instead of writing out two separate aws_instance resource blocks (one for the web server, one for the database server), you defined the EC2 instance logic once in the module. Then, you simply called that module twice, providing different inputs for each call.

This leads to:

Reusability: Use the same module to create many similar (but distinctly configured) resources.

Maintainability: If you need to change how an EC2 instance is configured (e.g., add a new default tag), you change it in one place (the module), and all calls to that module benefit.

Organization: Break down large, complex configurations into smaller, logical, and manageable units.

Abstraction: Hide complex implementation details within the module, exposing only the necessary inputs and outputs.
"""




#Below really is the example


#It calls the module defined above to create multiple instances of EC2 servers
#with different configurations


#in below example     module "<LOCAL_NAME>"     defines a module call
#database_server_instanc: This is the local name you give to this specific instance of the module. It's how you'll refer to its outputs (e.g., module.web_server_instance.instance_id)

# main.tf (in your root directory)
module "web_server_instance" {
  
  #when you run the EC2 module for the web server use below configs (after source = ...)


  source = "./modules/my-ec2-module" # Path to your module directory
  #can be local path, Git repo, or Terraform Registry module
  #says "I'm going to use the EC2 module, and for this first time, I'll call it 'web_server_instance' in my plan."

  #./modules/my-ec2-module: local path relative to the current working directory
  #Other sources can be used: Git repositories (git::https://example.com/repo.git), S3 buckets, OpenTofu Registry.



  #arguments like below, inside the module block correspond to the 
  #variable declarations withing the module
  #outputs from a module are acessed via module.<LOCAL_NAME>.<OUTPUT_NAME>

  instance_name = "WebServer01" #1st server, call it "WebServer01"
  instance_type = "t2.medium"   #size for server
  ami_id        = "ami-053b0d53c2792790b" # Replace with a valid AMI
  #a specific AMI ID for web server
}


module "database_server_instance" {

  #when run EC2 module for database server use below config (after source...)

  source = "./modules/my-ec2-module"

  instance_name = "DBServer01"  #name 2nd server
  instance_type = "t2.small"    #size
  ami_id        = "ami-053b0d53c2792790b" # Replace with a valid AMI
}



output "web_server_id" {
  #in root configuration exposes output from one of the module calls
  #action: After everything is built, show me the unique ID of the server I called 'web_server_instance'."

  value = module.web_server_instance.instance_id
  #instance_id from web_server_instance module call
  #OpenTofu will get the ID of teh EC2 instance created by specific 
  #module instance and display it as web_server_id in root output
}


