
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2_cloudinit.public_ip
}

output "website_url" {
  description = "URL of the NGINX website"
  value       = "http://${aws_instance.ec2_cloudinit.public_ip}"
}
