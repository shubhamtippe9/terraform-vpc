provider "aws" {
    region = "us-east-1"
  
}
resource "aws_vpc" "my-vpc" {
    cidr_block = "121.12.0.0/16"

}
resource "aws_subnet" "my-subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "121.12.0.0/20"
    tags = {
      Name = "private-subnet"
    }
    availability_zone = "us-east-1a"
}
resource "aws_subnet" "my-subnet-1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "121.12.16.0/20"
    map_public_ip_on_launch = true
    tags = {
        Name = "public-subnet"
    }
    availability_zone = "us-east-1a"
}
resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name = "my-igw"
    }
}
resource "aws_default_route_table" "my-route-table" {
    default_route_table_id = aws_vpc.my-vpc.default_route_table_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id
    }
}
resource "aws_route_table_association" "my-route-table-association" {
    subnet_id = aws_subnet.my-subnet-1.id
    route_table_id = aws_default_route_table.my-route-table.id
}
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.my-subnet.id
  tags = {
    Name = NAT-RT
  }
  depends_on = [aws_internet_gateway.igw]
}
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.NAT-RT.id
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.my-subnet.id
  route_table_id = aws_route_table.private_rt.id
}

