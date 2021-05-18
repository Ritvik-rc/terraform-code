resource "aws_subnet" "subnets" {
    for_each = {
        "${var.zone_a.availability_zone}" = var.zone_a.cidr
        "${var.zone_c.availability_zone}" = var.zone_c.cidr 
    }
    availability_zone = each.key
    vpc_id = aws_vpc.LB_VPC.id
    cidr_block = each.value
    map_public_ip_on_launch = "true"
    tags = {
        Name = "PublicSubnet ${each.key}"
    }
}

resource "aws_subnet" "zone_b_subnet" {
    availability_zone = var.zone_b.availability_zone
    vpc_id = aws_vpc.LB_VPC.id
    cidr_block = var.zone_b.cidr
    tags = {
        Name = "PrivateSubnet"
    }
}

/* resource "aws_subnet" "zone_a_subnet" {
    availability_zone = "ap-south-1a"
    vpc_id = aws_vpc.LB_VPC.id
    cidr_block = "10.4.8.0/28"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "PublicSubnet1"
    }
}

resource "aws_subnet" "zone_b_subnet" {
    availability_zone = "ap-south-1b"
    vpc_id = aws_vpc.LB_VPC.id
    cidr_block = "10.4.8.32/27"
    tags = {
        Name = "PrivateSubnet"
    }
}

resource "aws_subnet" "zone_c_subnet" {
    availability_zone = "ap-south-1c"
    vpc_id = aws_vpc.LB_VPC.id
    cidr_block = "10.4.8.16/28"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "PublicSubnet2"
    }
} */