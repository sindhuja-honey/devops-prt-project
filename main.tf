provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "k8s" {
  ami           = "ami-07a00cf47dbbc844c"
  instance_type = "c7i-flex.large"

  tags = {
    Name = "k8s-node"
  }
}
