resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "sidhu_vpc"
  }
}
#creating a public subnet
resource "aws_subnet" "main_public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "anusha_public"
  }
}
#creating a private subnet
resource "aws_subnet" "main_private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "anusha_private"
  }
}
#creating an internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet_gateway"
  }
}
#creating public route table
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "anusha_public_rt"
  }
}

#creating private route table
resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main.id
  

  tags = {
    Name = "anusha_private_rt"
  }
}
resource  "aws_route_table_association" "public_subnet_association" {
    route_table_id = aws_route_table.public_route.id
    subnet_id = aws_subnet.main_public.id

}
resource "aws_route_table_association" "private_subnet_association" {
    route_table_id = aws_route_table.private_route.id
    subnet_id = aws_subnet.main_private.id
}
