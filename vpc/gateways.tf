resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.LB_VPC.id
    tags = {
    Name = "LB_VPC_IG"
  }
}

resource "aws_eip" "nat_eip" {}

resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.subnets[var.zone_a.availability_zone].id
    tags ={
        Name = "LB_NAT"
    }
}

/*
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.zone_a_subnet.id
    tags ={
        Name = "LB_NAT"
    }
}*/