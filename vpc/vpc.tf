resource "aws_vpc" "LB_VPC" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "LoadBalancerVPC"
    }
}