# Bandit Level 14

## Objective

Find the password for the next level.

## Problem

The password for the next level is stored in the password file for the current user.

The challenge is to submit this password to a service running on `localhost` on port `30000`.

## Approach

I first read the current user's password using the `cat` command.

I then used `netcat` (`nc`) to connect to the service running on port `30000`.

I used a pipe (`|`) to send the password directly from `cat` to the network service.

The service then returned the password for the next level.

## Command

```bash
cat /etc/bandit_pass/bandit14 | nc localhost 30000