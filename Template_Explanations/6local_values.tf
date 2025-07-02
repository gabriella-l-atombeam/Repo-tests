#Example at bottom

#Local values are named expressions that you can use to avoid repeating the same value 
#or complex expression multiple times within a module. They improve readability.


locals {
  #defines local values/variables, evaluated when use command "tofu plan" for plannning phase
  #cannot be set externally in command line, use "local.<LOCAL_VALUE_NAME>" to reference

  <LOCAL_VALUE_NAME> = <EXPRESSION>
  #LOCAL_VALUE_NAME = name gave local value, 
  #<EXPRESSION> defines val of local, 
  # A literal value (e.g., "MyAwesomeApp").
  # A reference to an input variable (e.g., var.environment).
  # A reference to an attribute of a resource or data source (e.g., aws_vpc.main.id).
  # A combination of other locals (e.g., "prefix-${local.some_value}-suffix").
  # An OpenTofu function call (e.g., lower(var.project_name)).
  # A complex data structure (e.g., a map or a list).

  another_local_value = "prefix-${local.some_value}-suffix"

}



#Example

locals {
  project_name = "MyAwesomeApp"
  common_tags = {
    Owner       = "DevTeam"
    ManagedBy   = "OpenTofu"
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "${local.project_name}-data-bucket-${random_id.suffix.hex}" # Using random_id for unique bucket name
  tags   = local.common_tags
}


