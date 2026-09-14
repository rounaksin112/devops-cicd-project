output "security_group_id" {
  description = "Created security group ID"
  value       = aws_security_group.this.id
}
