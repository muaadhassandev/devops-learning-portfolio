
### Level 19

```markdown
# Bandit Level 19

## Objective

Find the password for the next level.

## Problem

A setuid binary is available in the home directory.

The binary can be used to execute commands with the privileges of another user.

## Approach

I first inspected the available files and identified the setuid binary.

I then used the binary to execute a command that allowed me to access the password for the next level.

## Command

```bash
./bandit20-do cat /etc/bandit_pass/bandit20