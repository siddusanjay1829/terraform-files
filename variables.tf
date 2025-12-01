#vpc variables

variable "vpc_cidr_block" {
    description = "vpc cidr block"
    type = string
}

variable "vpc_instance_tenancy" {
    description = "vpc instance tenancy"
    type = string
}

variable "vpc_Name" {
    description = "vpc_name"
    type = string
}

#public subnet variables


 variable "pub_sub_cidr_block" {
    description = "pub sub cidr block"
   type = string
 }

 variable "pub_sub_Name" {
    description = "pub sub name"
   type = string
 }

#private subnet variable

 variable "pvt_sub_cidr_block" {
    description = "pvt sub cidr block"
    type = string
 }

 variable "pvt_sub_Name" {
    description = "pvt sub Name"
    type = string   
 }


 # Internet gateway var

 variable "IG_Name" {
    description = "Internet_gateway_Name"
    type = string
 }


#pub route table var

variable "pub_route_tab_cidr_block" {
    description = "pub_route_tab_cidr_block"
    type = string
}

variable "pub_route_tab_Name" {
    description = "public_route_table_Name"
    type = string  
}



#private route table var 

variable "pvt_route_tab_cidr_block" {
  description = "private_route_table_cidr_block"
  type = string
}

variable "pvt_route_tab_Name" {
    description = "private_route_table_Name"
  type = string
}


#Eip var

 variable "eip_Name" {
 description = "elastic_ip_address_Name"
type = string
 }

 #nat gateway var
 variable "aws_nat_gateway_name" {
description = "nat_gateway_Name"
type = string
 }

#key pair var

variable "key_pair_Name"{
  description = "Key_pair_name"
  type = string
}

variable "public_key"{
  description = "key_pair_public_key"
  type = string
}



#security group var

variable "sg_name"{
  description = "security_group_Name"
  type = string
}




#instance tenancy var public

variable "pub_aws_ins_ami" {
  description = "public_aws_instance_ami"
  type = string
}

variable "pub_aws_ins_type" {
  description = "public_aws_instance_type"
  type = string  
}

variable "pub_aws_ins_key_name" {
  description = "public_aws_ins_key_name"
  type = string
}

variable "pub_aws_associate_ip_address" {
 description = "associate_ip_address_for_public_aws_ins"
 type = bool  
}

variable "pub_aws_ins_name" {
  description = "public_aws_ins_name"
  type = string
}








#private aws instance tenancy

variable "pvt_aws_ins_ami" {
  description = "private_aws_instance_ami"
  type = string
}

variable "pvt_aws_ins_type" {
  description = "private_aws_instance_type"
  type = string  
}

variable "pvt_aws_ins_key_name" {
  description = "private_aws_ins_key_name"
  type = string
}

variable "pvt_aws_associate_ip_address" {
 description = "associate_ip_address_for_private_aws_ins"
 type = bool  
}

variable "pvt_aws_ins_name" {
  description = "private_aws_ins_name"
  type = string
}