terraform {
  backend "s3" {
    key = "terraform.tfstate" 
    bucket = "terraform.buck"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region_name
}
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = var.sg

  tags = {
    Name = "fct-instance"
  }
}
data "aws_security_group" "example" {
    filter {
      name   = "group-name"
      values = [var.sg_name]
    }
  }

