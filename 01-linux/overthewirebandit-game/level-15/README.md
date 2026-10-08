# Bandit Level 15

## Objective

Find the password for the next level.

## Problem

The password for the next level is obtained by connecting to a service running on `localhost` on port `30001`.

Unlike the previous level, this service requires an SSL/TLS encrypted connection.

## Approach

I used the `openssl` command to establish a secure SSL/TLS connection to the service running on port `30001`.

After the connection was established, I entered the password obtained from Level 14.

The service then returned the password for the next level.

## Command

```bash
openssl s_client -connect localhost:30001