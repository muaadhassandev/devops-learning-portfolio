
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "eu-west-2"
}

variable "instance_type" {
  description = "EC2 instance type for the WordPress server"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Name used to identify project resources"
  type        = string
  default     = "wordpress"
}



