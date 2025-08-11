variable "vpc_id" {}
variable "subnet_id" {}
variable "security_group_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "infinity_token" {
  sensitive = true
}
variable "waf_ami_id" {
  description = "AMI ID for CloudGuard WAF"
}
