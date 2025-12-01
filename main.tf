resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = var.vpc_instance_tenancy

  tags = {
    Name = var.vpc_Name
  }
}
#creating a public subnet
resource "aws_subnet" "main_public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub_sub_cidr_block

  tags = {
    Name = var.pub_sub_Name
  }
}
#creating a private subnet
resource "aws_subnet" "main_private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pvt_sub_cidr_block

  tags = {
    Name = var.pvt_sub_Name
  }
}
#creating an internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.IG_Name
  }
}
#creating public route table
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.pub_route_tab_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = var.pub_route_tab_Name
  }
}

#creating private route table
resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = var.pvt_route_tab_cidr_block
    gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = var.pvt_route_tab_Name
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
        Name = var.eip_Name

    
    }
}
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_ip.id
    subnet_id = aws_subnet.main_public.id

    tags = {
        Name = var.aws_nat_gateway_name
    }
}

# creating key pair

resource "aws_key_pair" "deployer" {
    key_name = var.key_pair_Name
    public_key = var.public_key
}

# creating security group
resource "aws_security_group" "sg" {
    name = var.sg_name
    description = "security group for terraform"
    vpc_id = aws_vpc.main.id

    tags = {
        Name = var.sg_name
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

#public 

resource "aws_instance" "web" {
  ami           = var.pub_aws_ins_ami
  instance_type = var.pub_aws_ins_type
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  subnet_id = aws_subnet.main_public.id
  key_name = var.pub_aws_ins_key_name
  associate_public_ip_address = var.pub_aws_associate_ip_address
  tags = {
    Name = var.pub_aws_ins_name
  }
}


# private

resource "aws_instance" "private" {
  ami           = var.pvt_aws_ins_ami
  instance_type = var.pvt_aws_ins_type
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  subnet_id = aws_subnet.main_private.id
  key_name = var.pvt_aws_ins_key_name
associate_public_ip_address = var.pvt_aws_associate_ip_address
  tags = {
    Name = var.pvt_aws_ins_name
  }
}