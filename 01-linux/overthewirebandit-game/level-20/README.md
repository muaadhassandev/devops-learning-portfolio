
### Level 20

```markdown
# Bandit Level 20

## Objective

Find the password for the next level.

## Problem

A setuid binary is available that connects to a specified localhost port.

The challenge requires running a service that provides the current password and then using the setuid binary to communicate with that service.

## Approach

I started a local network service that provided the current password.

I then used the setuid binary to connect to the service and receive the password for the next level.

## Command

```bash
# Terminal 1
echo "<current-password>" | nc -l 1234

# Terminal 2
./suconnect 1234