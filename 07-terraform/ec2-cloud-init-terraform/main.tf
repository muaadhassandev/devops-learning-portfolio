terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "cloudinit_vpc" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "cloud-init-vpc"
  }
}

resource "aws_subnet" "cloudinit_subnet" {
  vpc_id                  = aws_vpc.cloudinit_vpc.id
  cidr_block              = "10.0.0.0/26"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "cloud-init-public-subnet"
  }
}

resource "aws_internet_gateway" "cloudinit_igw" {
  vpc_id = aws_vpc.cloudinit_vpc.id

  tags = {
    Name = "cloudinit-igw"
  }
}

resource "aws_route_table" "cloudinit_rt" {
  vpc_id = aws_vpc.cloudinit_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cloudinit_igw.id
  }

  tags = {
    Name = "cloudinit-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.cloudinit_subnet.id
  route_table_id = aws_route_table.cloudinit_rt.id
}

resource "aws_security_group" "cloudinit_sg" {
  name        = "cloudinit-web-sg"
  description = "Allow HTTP traffic to the web server"
  vpc_id      = aws_vpc.cloudinit_vpc.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cloudinit-web-sg"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2_cloudinit" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.cloudinit_subnet.id
  vpc_security_group_ids      = [aws_security_group.cloudinit_sg.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/cloud-init.yml")

  tags = {
    Name = "cloud-init-web-server"
  }
}
