provider "aws" {
  region = var.region_name
 
}
resource "aws_instance" "fct" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = var.sg
     
    tags = {
        Name = "fct-instance"
    } 
}
