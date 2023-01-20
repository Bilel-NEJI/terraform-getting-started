# Step 16:
# we don't need a provider in "db.tf" because we already setted it up in "main.tf" under "modules/db" folder

resource "aws_instance" "myec2db" {
  ami = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}