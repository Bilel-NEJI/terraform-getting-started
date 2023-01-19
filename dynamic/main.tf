# Step 10:
provider "aws" {
  region = "eu-west-2"
}

# Step 10:
# we can use dynamic blocks as a good tool for aws security groups
# because you can set up ports in a dynamic block and make it easy to use in edit
# so we can start with two variables: one for "ingress" and one for "egress"
# we can create a security group using these variables; we could have this in something like a .tf file and each one could have a different envorinment so production could have different values and a dev environment can have different values, but this way we need to go and edit in several locations
# but by doing it with the dynamic blocks we can edit in a single location
# and to set that dynamic block, we already setted the two variables
# and to test this, go the folder "dynamic" and type "terraform init" and then "terraform apply"
variable "ingress_rules" {
  type    = list(number)
  default = [25, 80, 443, 8080, 8443]
}
variable "egress_rules" {
  type    = list(number)
  default = [443, 8443]
}

resource "aws_instance" "myec2db" {
  ami             = "ami-01a6e31ac994bbc09"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]
  tags = {
    Name = "Web Server"
  }
}

resource "aws_security_group" "web_traffic" {
  name = "Secure Server"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}