# Step 17: how to deal with multiple providers: aws and vault
# 1st way to setup multi-providers: to setup a provider for each api/server
# of course each provider will contact the api of that "aws" or "vault" in order to be able to pluu plugin
# provider "aws" {
#   region = "eu-west-2"
# }

# provider "vault" {

# }

# resource "aws_vpc" "myvpc" {
#   cidr_block = "10.0.0.0/16"
# }

# resource "vault_generic_secret" "mypassword" {

# }

# Step 17: how to deal with multiple providers: aws and vault
# 2ndt way to setup multi-providers: to setup a second aws provider
# the "alias" word helps us the select which provider to use
# then we add a asecond aws resource with the "provider" word to specify which "provider" to work with
# so this way we have two vpc in two regions
provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "ireland"
}

resource "aws_vpc" "londonvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "irelandvpc" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.ireland
}
