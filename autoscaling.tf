resource "aws_autoscaling_group" "web_asg" {
  name = "web-asg"
  vpc_zone_identifier = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]
  launch_configuration = aws_launch_configuration.web_launch_config.name
  min_size = 2
  max_size = 4
  desired_capacity = 2

  tag {
    key                 = "Name"
    value               = "Web Server"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "web_launch_config" {
  name = "web-launch-config"
  image_id = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.web_sg.id]

  user_data = <<-EOF
    #!/bin/bash

    yum install -y httpd mysql php

    wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-100-RESTRT-1/267-lab-NF-build-vpc-web-server/s3/lab-app.zip
    unzip lab-app.zip -d /var/www/html/

    chkconfig httpd on
    service httpd start
  EOF
}
