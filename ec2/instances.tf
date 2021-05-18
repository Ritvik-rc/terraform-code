resource "aws_instance" "target" {
  count = var.no_of_instance
  ami = var.image_id
  instance_type = var.instance_type
  key_name = "TestPair"
  subnet_id = var.pvt_sub_id
  vpc_security_group_ids = ["${aws_security_group.LB_SG.id}"]
  user_data = "${file("../user_data.sh")}"
  tags = {
    Name = "Target_Instance${count.index}"
  }
}

resource "aws_instance" "controller" {
  ami = var.image_id
  instance_type = var.instance_type
  key_name = "TestPair"
  subnet_id = var.pub1_sub_id
  vpc_security_group_ids = ["${aws_security_group.LB_SG.id}"]
  tags = {
    Name = "Controller_Instance"
  }
}