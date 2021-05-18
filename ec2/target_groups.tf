resource "aws_lb_target_group" "LB_targets" {
    name = "LBtargets"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id  
}

resource "aws_lb_target_group_attachment" "attachment" {
  count = var.no_of_instance
  target_group_arn = aws_lb_target_group.LB_targets.arn
  target_id = aws_instance.target[count.index].id
  port = 80
}
