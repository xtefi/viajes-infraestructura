resource "aws_vpc" "eventsdava-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "eventsdava-vpc"
        Owner = "Eventsdava"
    }
}

resource "aws_subnet" "public-subnet-eventsdava" {
    vpc_id = aws_vpc.eventsdava-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {
        Name = "public-subnet"
    }  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.eventsdava-vpc.id
    tags = {
        Name = "igw"
    }
}

resource "aws_route_table" "rt-public" {
    vpc_id = aws_vpc.eventsdava-vpc.id

   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route-table"
  }
}

resource "aws_route_table_association" "rt-public-1" {
    subnet_id =  aws_subnet.public-subnet-eventsdava.id
    route_table_id = aws_route_table.rt-public.id
  
}
