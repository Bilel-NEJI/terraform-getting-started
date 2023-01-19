# Step 12:
provider "aws" {
  region = "eu-west-2"
}

# in this case, we image that we want our "myec2db" "DB server" comes up and starts first; before our "Web server" "myec2" starts
# so we use "depends_on"
# terraform gives you the ability to create resources by an order you choose
# then we do the folder "dependency" and type "terraform init" and then "terraform apply"
resource "aws_instance" "myec2" {
  ami = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }

  depends_on = [aws_instance.myec2db]
}

resource "aws_instance" "myec2db" {
  ami = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}