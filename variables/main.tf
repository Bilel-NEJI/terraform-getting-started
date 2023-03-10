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
  type    = string
  default = "myvpc"
}

# Step 6:
# here is a number/integer variable
variable "sshport" {
  type    = number
  default = 22
}

# Step 6:
# here is a Boolean variable
# this one can be used as a feature switch since booealn values are either true or false
variable "enabled" {
  default = true
}

# Step 6:
# here is a List variable, it can hold only "string" or "number"
# a list can be used for example for firewall rules
# the list index always starts with "zero"; so index "0" gives us "Value1"
variable "mylist" {
  type    = list()
  default = ["Value1", "Value2"]
}

# Step 6:
# here is a Map variable
variable "mymap" {
  type = map(any)
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

# Step 8:
# what it does, it gives a chance for you to use it manually set a variable when we run "terraform plan"
variable "inputname" {
  type        = string
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

  # part of Step 8 inside Step 7 (applied on some part of Step 7):
  tags = {
    Name = var.inputname
  }

  # part of Step 7:
  #   tags = {
  #     Name = var.mylist[0]
  #   }
  # part of Step 7:
  #   tags = {
  #     Name = var.mymap["Key1"]
  #   }

}

# Step 9:
# the advantages of tghe output is that it shows us details about the resources we have created
# after writing the output, when we type "terraform apply", we'll get the value of the "id"
# and the reason it won't work in "terraform plan" is because we haven't actually created the vpc, it's a computed value. So to run it type "Terraform apply"
# to destroy the resources just type "terraform destroy"
# to display all the outputs type "terraform output"
output "vpcid" {
  value = aws_vpc.myvpc.id
}

# Step 11: tuple
# inside the tuple we can define the data type we need
variable "mytuple" {
  type    = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

# Step 11: object
# inside the object we can structure multiple data types
variable "myobject" {
  type = object({name = string, port = list(number)})
  default = {
    name = "Bilel"
    port = [ 22, 25, 80 ]
  }
}