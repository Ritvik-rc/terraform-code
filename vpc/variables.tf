variable "zone_a" {
    type = map
    default = {
        availability_zone = "ap-south-1a"
        cidr = "10.4.8.32/28"
    }
}
variable "zone_b" {
    type = map
    default = {
        availability_zone = "ap-south-1b"
        cidr = "10.4.8.0/27"
    }
}
variable "zone_c" {
    type = map
    default = {
        availability_zone = "ap-south-1c"
        cidr = "10.4.8.64/28"
    }
}
variable "vpc_cidr" {
  type = string
  default = "10.4.8.0/24"
}