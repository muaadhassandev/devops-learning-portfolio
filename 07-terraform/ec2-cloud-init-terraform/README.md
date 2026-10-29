# EC2 Deployment with Terraform and Cloud-Init

## Overview

This project demonstrates how to deploy an EC2 web server on AWS using Terraform and configure it automatically using cloud-init.

The objective was to provision the required AWS infrastructure, launch an Ubuntu EC2 instance and automatically install and configure NGINX without manually connecting to the server.

## Architecture

The deployment includes:

- **VPC:** Custom AWS network.
- **Public subnet:** Hosts the EC2 instance.
- **Internet Gateway:** Provides internet connectivity to the VPC.
- **Route table:** Routes internet-bound traffic through the Internet Gateway.
- **Security Group:** Allows inbound HTTP traffic on port 80 and outbound traffic.
- **EC2:** Ubuntu 24.04 instance running NGINX.
- **Cloud-init:** Automatically installs and starts NGINX when the instance launches.

## Technologies Used

- AWS
- Terraform
- HCL
- Cloud-init
- YAML
- Ubuntu 24.04
- NGINX

## How It Works

1. Terraform provisions the VPC and networking components.
2. A public subnet is created and associated with a route table.
3. An Internet Gateway provides internet connectivity.
4. A security group allows HTTP traffic on port 80.
5. Terraform retrieves an official Ubuntu AMI and launches an EC2 instance.
6. The cloud-init YAML file is passed to EC2 through the `user_data` argument.
7. Cloud-init installs NGINX and starts the service automatically.
8. The NGINX webpage is accessible through the instance's public IPv4 address.

## Project Structure

```text
ec2-cloud-init-terraform/
├── main.tf
├── outputs.tf
├── cloud-init.yml
├── README.md
└── screenshots/
    ├── terraform-apply.png
    └── nginx-website.png
```

## Deployment

Initialise Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Review the deployment plan:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply
```

Retrieve the website URL:

```bash
terraform output website_url
```

## Verification

After deployment, I accessed the EC2 instance's public IP address through a web browser.

The custom webpage confirmed that:

- The EC2 instance was successfully deployed.
- Cloud-init installed NGINX automatically.
- NGINX successfully served the custom HTML page.

## Screenshots

### Terraform Deployment

![Terraform Apply](screenshots/terraform-apply.png)

### NGINX Webpage

![NGINX Website](screenshots/nginx-website.png)

## Cleanup

To avoid unnecessary AWS charges, I removed the infrastructure after testing:

```bash
terraform destroy
```

## Key Takeaway

This project demonstrates how Infrastructure as Code and cloud-init can work together to automate both infrastructure provisioning and server configuration.

Terraform created the infrastructure, while cloud-init handled the software installation and configuration on the EC2 instance.