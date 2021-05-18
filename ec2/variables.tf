variable "image_id" {
  type = string
  default = "ami-0bcf5425cdc1d8a85"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "no_of_instance" {
  type = number
  default = 2
}

variable "vpc_id" {
  type = string
}

variable "pub1_sub_id" {
  type = string
}

variable "pub2_sub_id" {
  type = string
}

variable "pvt_sub_id" {
  type = string
}