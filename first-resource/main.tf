# Step 1:
# in thsi first example we want to create a resource in AWS
# for this we need to create a "provider"
# of course we need an AWS account and to create a user and assign the specific permissions to do so
# the provider is the one who is going to to pull the AWS plugin in order to make us able to create our first resource
provider "aws" {
  region = "eu-west-2"
  access_key = "blablablablablabla-from-aws-account"
  secret_key = "blablablablablabla-from-aws-account"
}
# Step 4:
# having the access key like this is not a good practice
# so there are two ways to do it:
# --> first method is to set the two line below
# AWS_ACCESS_KEY_ID=
# AWS_SECRET_KEY_ID=
# on "linux" and "mac" you should use "export AWS_ACCESS_KEY_ID=...."
# on "windows" you should use "setx AWS_ACCESS_KEY_ID=...."
# --> the second method is to use AWS CLI; which creates a hidden folder inside your home directory
# and stores your credentials in there.
# and when using one of these methods, you can of course go and remove the hardcoded line
# that includes the access key and the secret key


# Step 2:
# the "resource" here is what we want to create
# and the "type" is the type of what we want to create
# and the "name" is how we want to call it internally
# and the "cidr_block" is a required line
# then now we are ready to create our first resource
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}
# Step 3:
# after writing this line code we go the folder of the "first resource"
# and we intialize our project by entering that folder
# and write the command "terraform init"
# this command will pull the plugin from the provider and set up a state file
# then "".terraform" folder wil be created with a bundel of files
# then you can type "terraform plan" so terraform will prepare a plan to execute showing
# a lot of details which represente the resources going to be created
# then you can type "terraform apply"
