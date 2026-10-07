
### Level 13

```markdown
# Bandit Level 13

## Objective

Find the password for the next level.

## Problem

The password for the next level is stored in `/etc/bandit_pass/bandit14`.

The challenge provides an SSH private key that can be used to authenticate as the next user.

## Approach

I first identified the SSH private key in the home directory.

I then used the key to connect to the next level instead of using a password.

## Command

```bash
ssh -i sshkey.private bandit14@localhost