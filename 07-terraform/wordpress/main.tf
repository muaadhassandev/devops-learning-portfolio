terraform {
    providers{
        aws = {
            source = "hashicorp/aws"
        }
    }
}

provider "aws" {
    region = "eu-west-2"
}

resource "aws_vpc" wordpress_vpc" {
    cidr_block = "10.0.0.0/24"

    tags = {
        Name = "wordpress_vpc
    }
}

resource "aws_internet_gateway" "wordpress_igw {
    vpc_id = aws_vpc.wordpress_vpc.id
}

resource "aws_subnet" "public-subnet-wordpress" {
    vpc_id = aws_vpc.wordpress_vpc.id
    cidr_block = 10.0.0.0/26

    tags = {
    Name = "wordpress-public-subnet"
  }
}

resource "route_table" "route-t_wordpress" {
    vpc_id = aws_vpc.wordpress_vpc.id

    route {
        cidr_block = 0.0.0.0/0
        gateway_id = aws_internet_gateway.wordpress_igw.id

    }
}

