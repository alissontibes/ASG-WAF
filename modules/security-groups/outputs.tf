output "waf_sg_id" {
  description = "Security Group ID for WAF instances"
  value       = aws_security_group.waf_sg.id  # Make sure the resource name matches your SG resource
}
