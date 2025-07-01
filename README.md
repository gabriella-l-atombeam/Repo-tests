# Repo-tests
#
### Everything here is meant to act as templates so that I can just reference these if I need to write in HCL. 


- First I go through all the files I was given, 

- Then in the comments I add what each variable could equal
    - eg. in the 1provider_config.tf file, in the # providers.tf file
        - where it says region = "your-aws-region" 
            - that list of different regions are a great example of what could go there


#
### General Structure of OpenTofu Files
While you can put everything in main.tf, it's good practice to organize your code into logical files:

- versions.tf: terraform block with required_providers and required_version.

- providers.tf: provider blocks for configuring AWS (and other providers).

- variables.tf: All variable declarations.

- main.tf: The primary resource declarations.

- outputs.tf: All output declarations.

- locals.tf: All locals blocks.

- data.tf: All data source declarations.

- modules/: A directory containing subdirectories for your custom modules.

- terraform.tfvars: A file to provide default values for your variables. Never commit sensitive data here.

This general structure and these formulas will provide a solid foundation for coding AWS infrastructure with OpenTofu. Remember to always consult the official OpenTofu AWS Provider Documentation for specific resource arguments and examples.