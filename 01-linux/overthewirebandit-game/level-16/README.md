
### Level 16

```markdown
# Bandit Level 16

## Objective

Find the password for the next level.

## Problem

The password must be submitted to one of several ports on localhost.

Only one of the services provides the correct SSL/TLS connection.

## Approach

I first scanned the specified port range to identify which ports were open.

I then tested the available services and identified the one using SSL/TLS.

After connecting to the correct service, I provided the current password and obtained an SSH private key for the next level.

## Command

```bash
nmap -sV -p 31000-32000 localhost