# Startup project from default vpc
resource "aws_vpc" "default_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.vpc_name}"
  }
}
# Create internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.default_vpc.id

    tags = {
    Name = "${var.vpc_name}-igw"
  }
}
# Create public subnet
resource "aws_subnet" "pub_subnet" {
    vpc_id      = aws_vpc.default_vpc.id
    cidr_block  = var.pub_cidr
    availability_zone = var.azs[0]
    map_public_ip_on_launch = true

    tags = {
    Name = "${var.vpc_name}-pub_subnet"
  }
}

# Create private subnet
resource "aws_subnet" "pri_subnet" {
    vpc_id      = aws_vpc.default_vpc.id
    cidr_block  = var.pri_cidr
    availability_zone = var.azs[1]
    map_public_ip_on_launch = true

    tags = {
    Name = "${var.vpc_name}-pri_subnet"
  }
}
# Create public route table
resource "aws_route_table" "public_rt" {
    vpc_id      = aws_vpc.default_vpc.id
  
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
      Name = "${var.vpc_name}-public-rt"
    }
}
# Associate public rt to pub subnet
resource "aws_route_table_association" "rt_pub_ass" {
    subnet_id = aws_subnet.pub_subnet.id
    route_table_id = aws_route_table.public_rt.id
}
