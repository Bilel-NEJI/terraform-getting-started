# Step 16:
# we create a provider and the resource "myec2"
# and of course we created the "db.tf" file where we putted the db-resource portion
# then we add a module block
# then we go inside the "module" folder and type, "terraform init", then "terraform apply", so terraform will see if we have modules inside and read the path from the db-module "./db"
# so with that path it can redirect to the file "db.tf"
# then it concludes that it has two EC2 instances to setup
# so we can say that modules are simply folders with terraform code ins there, local or remote is exactly the same concept
provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "myec2" {
  ami = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }
}

module "dbserver" {
  source = "./db"
}