resource "aws_autoscaling_group" "jenkins_asg" {
  name                 = "jenkins_asg"
  launch_configuration = "${aws_launch_configuration.jenkins_launch_configuration.name}"
  min_size             = 1
  max_size             = 2
  vpc_zone_identifier  = [
    "${var.public_subnet_id}"
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "jenkins_launch_configuration" {
  image_id        = "${var.image_id}"
  instance_type   = "${var.instance_type}"
  key_name        = "MyKeyPair"
  security_groups = [
    "${var.public_subnet_1_sg_id}"
  ]

  root_block_device {
    volume_type           = "standard"
    volume_size           = 100
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  user_data       = <<EOF
    #!/bin/bash
    yum update -y
    sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkinsci.org/redhat/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
    yum install jenkins -y
    service jenkins start
  EOF
}