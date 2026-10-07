
### Level 14

```markdown
# Bandit Level 14

## Objective

Find the password for the next level.

## Problem

The password for the next level must be submitted to a service running on localhost on port `30000`.

## Approach

I first obtained the current level's password.

I then connected to the service running on port `30000` and provided the password to it.

## Command

```bash
cat /etc/bandit_pass/bandit14 | nc localhost 30000