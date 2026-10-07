
### Level 9

```markdown
# Bandit Level 9

## Objective

Find the password for the next level.

## Problem

The password is stored in `data.txt` among several human-readable strings.

The challenge is to identify the string that contains several `=` characters.

## Approach

I used the `strings` command to extract human-readable text from the file.

I then used `grep` to search the output for the lines containing `=` characters.

## Command

```bash
strings data.txt | grep "="