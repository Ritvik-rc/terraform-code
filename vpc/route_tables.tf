resource "aws_route_table" "Pvt_RT" {
    vpc_id = aws_vpc.LB_VPC.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gw.id
    }

    tags = {
        Name = "LB_Pvt"
    }
}

resource "aws_route_table" "Pub_RT" {
    vpc_id = aws_vpc.LB_VPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

    route {
        ipv6_cidr_block = "::/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

    tags = {
        Name = "LB_Pub"
    }
}

resource "aws_main_route_table_association" "main_RT_assc" {
    vpc_id = aws_vpc.LB_VPC.id
    route_table_id = aws_route_table.Pub_RT.id
}

resource "aws_route_table_association" "pvt_RT_assc" {
    subnet_id = aws_subnet.zone_b_subnet.id
    route_table_id = aws_route_table.Pvt_RT.id
}

resource "aws_route_table_association" "pub_RT_assc" {
    for_each = toset( [var.zone_a.availability_zone, var.zone_c.availability_zone] )
    subnet_id = aws_subnet.subnets[each.key].id
    route_table_id = aws_route_table.Pub_RT.id
}

/*resource "aws_route_table_association" "pub2_RT_assc" {
    subnet_id = aws_subnet.zone_c_subnet.id
    route_table_id = aws_route_table.Pub_RT.id
}*/