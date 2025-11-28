resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "siddu_vpc"
  }
}
#creating a public subnet
resource "aws_subnet" "main_public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "siddu_public"
  }
}
#creating a private subnet
resource "aws_subnet" "main_private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "siddu_private"
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
    Name = "siddu_public_rt"
  }
}

#creating private route table
resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "siddu_private_rt"
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

# creating eip and nat gateway

resource "aws_eip" "nat_ip" {
    tags = {
        Name = "nat_eip"

    
    }
}
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_ip.id
    subnet_id = aws_subnet.main_public.id

    tags = {
        Name = "nat_gateway"
    }
}

# creating key pair

resource "aws_key_pair" "deployer" {
    key_name = "siddu_key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQMFaT5cK/X9hfcJO7JFTR+OUTagkGSh9Wdf4Zj7HOIRAm7oSxHqGHqBFjhHpYUpR+eKvQn2OpPrf03eg00MW+94gU6iOcLUCRXdJTIQlzo6gsdxDHnx4oQayLjiNCTZGqolnMDumrBmJ+rp4CIqE9jkLBBGheUVuakoRa5iHG5iVo5pfjRPy7Lvy0BxZ8LpP/Q/2w4aEQGIqqQE0GUVM440GlDfT188E35VOjPpIep0WnByK+g2CbuxNGqfLvPwd94hUHqdjYkWCZm0G+wUQvd1ZDYt6fFcFPiS/SfrvtL269RbIjFSy2qOYBTvbl/K1IJyPAZls8OD1PKOvjajmJ8txX/C+bLCZyMPFiDfI56RJA6L3dC8B7LSo0OZ9QWIDxTSBZyirdVKnUzWDe6vzJdoT/Z3TYEgmBsF1Km5irtX13CfFGp+ZzR2HSyXd+RbBcZ+olwUL1choRfEPPNLlPQsna+GVBQaY9V4gRuo5/bCc/NiEc6vdxk/54+VecCn4KMmDUOA7dDKp8n3EXdv6o/CX4J0rXkVcX7h3YPEA0764cBAHUoxMLo8yOVxg5h0w/JtGLNEGtbkh/SQVlxdH1nsx2IU8+CkmZv1sJDhGibp+ikKs0heIwofcyalvnHF73jOmBDnz3KUZGaihhFqQCfm9eYUiML6HknUP46+bth2EQ== siddu@DESKTOP-R4M3L54"
}

# creating security group
resource "aws_security_group" "sg" {
    name = "siddu_sg"
    description = "security group for terraform"
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "siddu_sg"
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# creating instance_tenancy

resource "aws_instance" "web" {
  ami           = "ami-02b8269d5e85954ef"
  instance_type = "c7i-flex.large"
  security_groups = [ aws_security_group.sg.id ]
  subnet_id = aws_subnet.main_public.id
  key_name = "siddu_key"
associate_public_ip_address = true
  tags = {
    Name = "terraform-ec2"
  }
}


# private

resource "aws_instance" "private" {
  ami           = "ami-02b8269d5e85954ef"
  instance_type = "c7i-flex.large"
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  subnet_id = aws_subnet.main_private.id
  key_name = "siddu_key"
associate_public_ip_address = false
  tags = {
    Name = "terraform-ec2"
  }
}