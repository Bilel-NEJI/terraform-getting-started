# Step 13:
# we continue work with the same file from the "dependency" "main.tf" file
# so we should have our two instances (with the "depends_on" feature)
# so we then should set up our datasource which is going to make an API request to aws to find out some details
# our example here will be: querying aws for any instance that has the tag of "DB server"
provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "myec2" {
  ami           = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }

  depends_on = [aws_instance.myec2db]
}

resource "aws_instance" "myec2db" {
  ami           = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}

data "aws_instance" "dbsearch" {
  filter {
    name   = "tag.Name"
    values = ["DB Server"]
  }
}

# and to show how this is working, we are going to use an output
# then we go and type "terraform apply"
output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}
