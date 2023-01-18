# Step 7:
# how to use a variable
# so now we are going to use our varaibles
# so this we shoud create/copy the provider from the first-resource/main.tf file
# and also copy the resource part
# we can use this way (meaning by declaring variable for the provider and resource) if we need in the future to change something
provider "aws" {
  region = "eu-west-2"
}


# Step 6:
# here we are decalring our/some varaibles
# here is a String variable
variable "vpcname" {
  type = string
  default = "myvpc"
}

# Step 6:
# here is a number/integer variable
variable "sshport" {
  type = number
  default = 22
}

# Step 6:
# here is a Boolean variable
# this one can be used as a feature switch since booealn values are either true or false
variable "enabled" {
  default = true
}

# Step 6:
# here is a List variable
# a list can be used for example for firewall rules
# the list index always starts with "zero"; so index "0" gives us "Value1"
variable "mylist" {
  type = list()
  default = ["Value1", "Value2"]
}

# Step 6:
# here is a Map variable
variable "mymap" {
  type = map
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

# Step 8:
# what it does, it gives a chance for you to use it manually set a variable when we run "terraform plan"
variable "inputname" {
  type = string
  description = "Set the name of the VPC"
  # then we can use it like so:
  # resource "aws_vpc" "myvpc" {
  # cidr_block = "10.0.0.0/16"

  # tags = {
  #   Name = var.inputname
  #   }
  # }
  # 
  # then you go inside the variabales folder and type "terraform init" then "terraform plan"
  # when doing that the terminal will display the "description" test to enter a value

}


# Step 7
# this resource is a part of the Step 7
# we are going the se how use the string variable | list variable |
# then we are going to set the name of the (which is right bellow) vpc using that variable by adding the tags/Name = var.vpcname (the name of our declared variable in Step 6)
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

# this the first example in Step 7
# this will be changed to use the Step 8 input variable
  # tags = {
  #   Name = var.vpcname
  # }

  tags = {
    Name = var.inputname
  }

#   tags = {
#     Name = var.mylist[0]
#   }

#   tags = {
#     Name = var.mymap["Key1"]
#   }

}