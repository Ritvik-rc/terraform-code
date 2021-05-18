resource "aws_lb" "application_LB" {
    name = "application-LB"
    load_balancer_type = "application"
    security_groups = ["${aws_security_group.LB_SG.id}"]
    subnets = ["${var.pub1_sub_id}","${var.pub2_sub_id}","${var.pvt_sub_id}"]
}

resource "aws_lb_listener" "app_LB_listener" {
    load_balancer_arn = aws_lb.application_LB.id
    port = 80
    protocol = "HTTP"
    default_action {
        target_group_arn = aws_lb_target_group.LB_targets.id
        type = "forward"
    }
}