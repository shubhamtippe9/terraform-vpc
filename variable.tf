variable "region_name" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0f3caa1cf4417e51b"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "north"
}

variable "sg" {
  default = ["sg-0c9b1e5f8e8b2a1c2"]
}