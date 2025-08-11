resource "aws_instance" "waf" {
  ami           = var.waf_ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name      = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    echo "Registering CloudGuard WAF with Infinity Portal..."
    /opt/CPsuite-R81.20/fw1/bin/portal_registration.sh ${var.infinity_token}
  EOF

  tags = {
    Name = "CloudGuard-WAF"
  }
}
