resource "aws_launch_template" "cloudguard_waf_lt" {
  name_prefix   = "cloudguard-waf-"
  image_id      = var.waf_ami_id != "" ? var.waf_ami_id : "resolve:ssm:/aws/service/marketplace/prod-d9ada83e-6d91-448f-8097-63a789504f5f/latest"
  instance_type = var.waf_instance_type
  key_name      = var.ssh_key_name

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = var.public_subnet_id
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "CloudGuard-WAF"
    }
  }
}

resource "aws_autoscaling_group" "cloudguard_waf_asg" {
  name                      = "cloudguard-waf-asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  launch_template {
    id      = aws_launch_template.cloudguard_waf_lt.id
    version = "$Latest"
  }

  vpc_zone_identifier       = [var.public_subnet_id]

  tag {
    key                 = "Name"
    value               = "CloudGuard-WAF"
    propagate_at_launch = true
  }
}

output "asg_name" {
  value = aws_autoscaling_group.cloudguard_waf_asg.name
}
