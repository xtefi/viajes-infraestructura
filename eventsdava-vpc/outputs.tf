output "public-subnets" {
    value = aws_subnet.public-subnet-eventsdava.id
}

output "vpc-id" {
    value = aws_vpc.eventsdava-vpc.id
  
}

output "igw-id" {
    value = aws_internet_gateway.igw.id
  
}

output "public-route-table-id" {
  value = aws_route_table.rt-public.id
}