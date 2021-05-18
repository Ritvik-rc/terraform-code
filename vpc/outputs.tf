output "vpc_id" {
  value = aws_vpc.LB_VPC.id
}

output "pub1_sub_id" {
  value = aws_subnet.subnets[var.zone_a.availability_zone].id
}

output "pub2_sub_id" {
  value = aws_subnet.subnets[var.zone_c.availability_zone].id
}

output "pvt_sub_id" {
  value = aws_subnet.zone_b_subnet.id
}