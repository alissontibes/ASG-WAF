variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
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
  default     = "m5.xlarge"
  description = "Instance type for the CloudGuard WAF"
}

variable "ssh_key_name" {
  description = "Existing AWS EC2 key pair name for SSH access"
}

variable "infinity_token" {
  description = "Infinity Portal API token"
  sensitive   = true
}
