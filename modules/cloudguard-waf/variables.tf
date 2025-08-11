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
  type        = string
  default     = ""
}

variable "waf_instance_name" {
  description = "Name for the WAF instance"
  type        = string
  default     = "cloudguard-waf"
}

variable "ami_id" {
  description = "AMI ID (alternative name)"
  type        = string
  default     = ""
}
