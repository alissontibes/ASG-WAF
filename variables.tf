variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.20.0/24"]  # example CIDRs
}


variable "private_subnets" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "waf_instance_type" {
  description = "Instance type for CloudGuard WAF instances"
  type        = string
  default     = "c5.xlarge"  # or whatever default you want
}

variable "ssh_key_name" {
  description = "Name of the EC2 key pair for SSH access"
  type        = string
}

variable "waf_ami_id" {
  description = "AMI ID for CloudGuard WAF"
  type        = string
  default     = ""
}

variable "infinity_token" {
  description = "Check Point Infinity Token"
  type        = string
  sensitive   = true
}
