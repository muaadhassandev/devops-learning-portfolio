
### Level 15

```markdown
# Bandit Level 15

## Objective

Find the password for the next level.

## Problem

The password must be submitted to a service running on localhost using an encrypted SSL/TLS connection on port `30001`.

## Approach

I connected to the service using an SSL/TLS connection.

I then provided the current password to the service and received the password for the next level.

## Command

```bash
openssl s_client -connect localhost:30001