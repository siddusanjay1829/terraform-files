#vpc variable values

vpc_cidr_block = "10.0.0.0/16"
vpc_instance_tenancy = "default"
vpc_Name = "siddu_vpc"

#pub sub var val

pub_sub_cidr_block = "10.0.1.0/24"
pub_sub_Name = "siddu_public"

#pvt sub var val

pvt_sub_cidr_block = "10.0.2.0/24"
pvt_sub_Name = "siddu_private"

#IG var val

IG_Name = "internet_gateway"


#pub route tab var val

pub_route_tab_cidr_block = "0.0.0.0/0"
pub_route_tab_Name = "siddu_public_rt"

#pvt route tab var val

pvt_route_tab_cidr_block = "0.0.0.0/0"
pvt_route_tab_Name = "siddu_private_rt"

#eip var val

eip_Name = "nat_eip"

#nat gateway var val

aws_nat_gateway_name = "nat_gateway"

#key pair var val

key_pair_Name = "siddu_key"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQMFaT5cK/X9hfcJO7JFTR+OUTagkGSh9Wdf4Zj7HOIRAm7oSxHqGHqBFjhHpYUpR+eKvQn2OpPrf03eg00MW+94gU6iOcLUCRXdJTIQlzo6gsdxDHnx4oQayLjiNCTZGqolnMDumrBmJ+rp4CIqE9jkLBBGheUVuakoRa5iHG5iVo5pfjRPy7Lvy0BxZ8LpP/Q/2w4aEQGIqqQE0GUVM440GlDfT188E35VOjPpIep0WnByK+g2CbuxNGqfLvPwd94hUHqdjYkWCZm0G+wUQvd1ZDYt6fFcFPiS/SfrvtL269RbIjFSy2qOYBTvbl/K1IJyPAZls8OD1PKOvjajmJ8txX/C+bLCZyMPFiDfI56RJA6L3dC8B7LSo0OZ9QWIDxTSBZyirdVKnUzWDe6vzJdoT/Z3TYEgmBsF1Km5irtX13CfFGp+ZzR2HSyXd+RbBcZ+olwUL1choRfEPPNLlPQsna+GVBQaY9V4gRuo5/bCc/NiEc6vdxk/54+VecCn4KMmDUOA7dDKp8n3EXdv6o/CX4J0rXkVcX7h3YPEA0764cBAHUoxMLo8yOVxg5h0w/JtGLNEGtbkh/SQVlxdH1nsx2IU8+CkmZv1sJDhGibp+ikKs0heIwofcyalvnHF73jOmBDnz3KUZGaihhFqQCfm9eYUiML6HknUP46+bth2EQ== siddu@DESKTOP-R4M3L54"

#security group var val

sg_name = "siddu_sg"

#public AWS instance 

pub_aws_ins_ami = "ami-02b8269d5e85954ef"
pub_aws_ins_type = "c7i-flex.large"
pub_aws_ins_key_name = "siddu_key"
pub_aws_associate_ip_address = true
pub_aws_ins_name = "public_terraform-ec2"

#private aws instance

pvt_aws_ins_ami = "ami-02b8269d5e85954ef"
pvt_aws_ins_type = "c7i-flex.large"
pvt_aws_ins_key_name = "siddu_key"
pvt_aws_associate_ip_address = false
pvt_aws_ins_name = "Private_terraform-ec2"