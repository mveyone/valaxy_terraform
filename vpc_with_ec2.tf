resource "aws_instance" "Ubuntu" {
    ami = var.ami
    instance_type = "t2.micro"
    key_name = "Devops"
    tags = {
        Name = "ec2_instance"
    }
    subnet_id = aws_subnet.demo-subnet.id
    vpc_security_group_ids = [aws_security_group.demo-vpc-sg.id]
}

//create vpc
resource "aws_vpc" "demo-vpc" {
  cidr_block = "10.0.0.0/16"
}

//create subnet
resource "aws_subnet" "demo-subnet" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "demo-subnet"
  }
}

//internet gw resource
resource "aws_internet_gateway" "demo-igw" {
  vpc_id = aws_vpc.demo-vpc.id

  tags = {
    Name = "demo-igw"
  }
}

// route table
resource "aws_route_table" "demo-rt" {
  vpc_id = aws_vpc.demo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-igw.id
      }

  tags = {
    Name = "demo-rt"
  }
}

//associate route table to subnet
resource "aws_route_table_association" "demo-rt-association" {
  subnet_id      = aws_subnet.demo-subnet.id
  route_table_id = aws_route_table.demo-rt.id
}

//sg
resource "aws_security_group" "demo-vpc-sg" {
  name        = "demo-vpc-sg"
  vpc_id      = "${aws_vpc.demo-vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}