#a resource is an "infrastructure object"

resource "<PROVIDER_NAME>_<RESOURCE_TYPE>" "<LOCAL_NAME>" {
  # Required arguments specific to the resource type
  # e.g., for an EC2 instance: ami, instance_type

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