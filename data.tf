data "aws_ami" "cloudguard_waf" {
  most_recent = true
  owners      = ["679593333241"]  # Check Point AWS Account ID

  filter {
    name   = "name"
    values = ["Check Point CloudGuard WAF*"]
  }
}
