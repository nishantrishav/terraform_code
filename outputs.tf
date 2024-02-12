output "web_sg_id" {
  value = aws_security_group.web_sg.id
}

output "web_lb_dns_name" {
  value = aws_lb.web_lb.dns_name
}

output "web_server_1_private_ip" {
  value = aws_instance.web_server_1.private_ip
}

output "web_server_2_private_ip" {
  value = aws_instance.web_server_2.private_ip
}

output "web_lb_listener_arn" {
  value = aws_lb_listener.web_lb_listener.arn
}

output "web_lb_target_group_arn" {
  value = aws_lb_target_group.web_target_group.arn
}

output "web_asg_name" {
  value = aws_autoscaling_group.web_asg.name
}


