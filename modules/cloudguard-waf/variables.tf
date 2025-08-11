variable "waf_instance_type" {
  description = "Instance type for the CloudGuard WAF"
  type        = string
}

variable "ssh_key_name" {
  description = "SSH key name for EC2 instance access"
  type        = string
}

variable "public_subnet_id" {
  description = "Subnet ID where instances will be launched"
  type        = string
}

variable "waf_ami_id" {
  description = "AMI ID for CloudGuard WAF (optional if using SSM alias)"
  type        = string
  default     = ""
}

variable "infinity_token" {
  description = "Check Point Infinity token"
  type        = string
  sensitive   = true
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = ""  # or remove if not used
}

variable "security_group_id" {
  description = "Security Group ID for the WAF instances"
  type        = string
  default     = ""
}
