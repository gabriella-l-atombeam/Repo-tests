locals {
  <LOCAL_VALUE_NAME> = <EXPRESSION>
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


