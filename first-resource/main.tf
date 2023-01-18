# in thsi first example we want to create a resource in AWS
# for this we need to create a "provider"
# of course we need an AWS account and to create a user and assign the specific permissions to do so
# the provider is the one who is going to to pull the AWS plugin in order to make us able to create our first resource
provider "aws" {
  region = "eu-west-2"
  access_key = "blablablablablabla-from-aws-account"
  secret_key = "blablablablablabla-from-aws-account"
}

# the "resource" here is what we want to create
# and the "type" is the type of what we want to create
# and the "name" is how we want to call it internally
# and the "cidr_block" is a required line
# then now we are ready to create our first resource
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}