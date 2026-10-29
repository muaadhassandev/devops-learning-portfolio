output "instance_public_ip" {
  description = "Public IPv4 address of the web server"
  value       = aws_instance.web.public_ip
}

output "website_url" {
  description = "URL of the NGINX website"
  value       = "http://${aws_instance.web.public_ip}"
}