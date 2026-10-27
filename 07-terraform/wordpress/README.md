# Deploy WordPress on AWS Using Terraform

## Overview

This project uses Terraform to provision AWS infrastructure for hosting a WordPress website. It demonstrates Infrastructure as Code (IaC), AWS networking, security groups, EC2 provisioning, and automated software installation using a user-data script.

## Architecture

The infrastructure is deployed in the AWS London region (`eu-west-2`).

Resources created:

- **VPC:** Provides an isolated network for the project.
- **Public subnet:** Hosts the WordPress EC2 instance.
- **Internet Gateway:** Provides a route between the VPC and the internet.
- **Route table:** Routes internet-bound traffic through the Internet Gateway.
- **Security group:** Controls inbound and outbound traffic.
- **EC2 instance:** Hosts the WordPress application.
- **User data:** Automates installation and configuration of Apache, PHP, MariaDB and WordPress.
- **Terraform outputs:** Display the EC2 instance ID, public IP address and website URL.

## Project Structure

```text
wordpress/
├── main.tf
├── variables.tf
├── outputs.tf
├── user_data.sh
└── README.md
```

## Technologies Used

- AWS EC2
- AWS VPC
- AWS Security Groups
- AWS Internet Gateway
- Terraform
- Ubuntu
- Apache
- PHP
- MariaDB
- WordPress
- Bash

## Deployment Steps

### 1. Initialise Terraform

```bash
terraform init
```

Downloads the required Terraform provider plugins.

### 2. Format