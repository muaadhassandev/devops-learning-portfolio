
### Level 18

```markdown
# Bandit Level 18

## Objective

Find the password for the next level.

## Problem

The password is stored in a file in the home directory.

The challenge is that the SSH session is immediately terminated after login.

## Approach

Instead of opening an interactive SSH session, I used SSH to execute a command directly on the remote machine.

I used the command to read the password file before the connection was terminated.

## Command

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme