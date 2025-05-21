#create VPC

resource "aws_vpc" "myvpc" {
cidr_block = var.vpc_cidr
enable_dns_Support = var.vpc_enable_dns_support
enable_dns_hostname = var.vpc_enable_dns_hostname
tags = {
Name = var.vpc_name
}
}

#create Internet gateway

resource "aws_Internet_Gateway" "igw" {
vpc_id = aws_vpc.myvpc.id
tags = {
Name = var.igw
}
}

#create 1 public subnet

resource "aws_subnet" "Pubsub" {
vpc_id = aws_vpc.myvpc.id
cidr_block = var.pubsub_cidr
map_public_ip_on_launch = var.map_pub_ip
tags = {
Name = var.pubsub_name
}
}


#create 1 private subnets

resource "aws_subnet" "Privsub" {
vpc_id = aws_vpc.myvpc.id
cidr_block= var.privsub_cidr
tags = {
Name = privsub_name
}
}


#create public route table and associate with public subnets

resource "aws_route_table" "pub-rt" {
vpc_id = aws_vpc.myvpc.id
route {
cidr_block = 0.0.0.0/0
gateway_id = aws_Internet_Gateway.igw.id
}
tags = {
Name = var.pub_rt_name
}
}

resource "aws_route_table_association" "Publicassociation" {
subnet_id = aws_subnet.Pubsub.id
route_table_id = aws_route_table.pub-rt.id
}


#create private route table and associate with private subnet

resource "aws_route_table" "priv-rt" {
vpc_id = aws_vpc.myvpc.id
route {
cidr_block = 0.0.0.0/0
gateway_id = aws_Internet_Gateway.igw.id
}
tags = {
Name = var.priv_rt_name
}
}

resource "aws_route_table_association" "Privateassociation" {
subnet_id = aws_subnet.Privsub.id
route_table_id = aws_route_table.priv-rt.id
}

#create security group allowing HTTP and SSH traffic

resource "aws_security_group" "Sec_grp" {
vpc_id = aws_vpc.myvpc.id
Name = var.sg_name

#Allow HTTP from anywhere

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_block = ["0.0.0.0/0"]
}
#Allow SSH from anywhere

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_block = ["0.0.0.0/0"]
}
#All outbound traffic

egress {
from_port = 0
to_port = 0
protocol = -1
cidr_block = ["0.0.0.0/0"]
}
tags = {
Name = var.sg_name
}