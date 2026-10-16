# Hosting a Website on AWS EC2 with NGINX and Cloudflare DNS

## Project Overview

This project demonstrates how to deploy a web server on AWS EC2 and make it accessible through a custom domain using Cloudflare DNS.

The goal was to understand how DNS, IP addressing, security groups, HTTP and web servers work together to serve a website over the internet.

## Technologies Used

- AWS EC2
- Amazon Linux 2023
- NGINX
- Cloudflare DNS
- Linux command line
- HTTP and DNS

## Architecture

1. A user enters my domain in a web browser.
2. Cloudflare DNS resolves the domain to the EC2 public IPv4 address.
3. The request reaches the EC2 instance through HTTP on port 80.
4. The EC2 security group allows the inbound HTTP traffic.
5. NGINX serves the default welcome page to the browser.

## Implementation Steps

### 1. Created an EC2 Instance

Launched an EC2 instance running Amazon Linux 2023.

Configured the security group to allow HTTP traffic on port 80 and restricted SSH access to my own IP address.

### 2. Installed and Started NGINX

Updated the system packages and installed NGINX.

Commands used:

```bash
sudo dnf update -y
sudo dnf install nginx -y
sudo systemctl enable --now nginx
```

Verified that NGINX was running:

```bash
sudo systemctl status nginx
```

### 3. Tested the Web Server

Accessed the EC2 public IPv4 address through a browser to verify that the NGINX welcome page was displayed.

### 4. Configured Cloudflare DNS

Created an A record in Cloudflare pointing my domain to the EC2 public IPv4 address.

Verified that the DNS record used the correct IP address and tested access through my domain.

### 5. Tested the Domain

Opened the domain in a browser and confirmed that it displayed the NGINX welcome page.

## Troubleshooting

During setup, the website worked through the EC2 public IP address but initially failed to load through the domain.

I checked the DNS A record, verified the destination IP address, and investigated the connection settings until the domain loaded successfully.

This reinforced the importance of testing each part of a network connection separately when troubleshooting.

## Key Takeaways

- How DNS maps a domain name to an IP address.
- How to launch and configure an EC2 instance.
- How security groups control inbound network traffic.
- How to install and manage NGINX on Linux.
- How to troubleshoot connectivity and DNS issues.
- How DNS, routing, ports and web servers work together.

## Screenshots

Screenshots documenting the EC2 instance, NGINX service, Cloudflare DNS configuration and live website are included in the `screenshots` directory.

## Future Improvements

- Configure HTTPS using a valid TLS certificate.
- Create a custom HTML landing page.
- Explore automated deployment.
- Investigate using an Elastic IP for a stable public address.