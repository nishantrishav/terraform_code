resource "aws_instance" "web_server_1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  subnet_id                    = aws_subnet.public_subnet_1.id
  associate_public_ip_address  = true

  tags = {
    Name = "Web Server 1"
  }

  user_data = <<-EOF
    #!/bin/bash

    yum install -y httpd mysql php

    wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-100-RESTRT-1/267-lab-NF-build-vpc-web-server/s3/lab-app.zip
    unzip lab-app.zip -d /var/www/html/

    chkconfig httpd on
    service httpd start
  EOF
}
resource "aws_instance" "web_server_2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  subnet_id                    = aws_subnet.public_subnet_2.id
  associate_public_ip_address  = true

  tags = {
    Name = "Web Server 2"
  }

  user_data = <<-EOF
    #!/bin/bash

    yum install -y httpd mysql php

    wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-100-RESTRT-1/267-lab-NF-build-vpc-web-server/s3/lab-app.zip
    unzip lab-app.zip -d /var/www/html/

    chkconfig httpd on
    service httpd start
  EOF
}


