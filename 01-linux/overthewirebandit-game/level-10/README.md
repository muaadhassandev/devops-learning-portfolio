
### Level 10

```markdown
# Bandit Level 10

## Objective

Find the password for the next level.

## Problem

The password is stored in `data.txt` and is encoded using Base64.

## Approach

I first inspected the contents of `data.txt` and identified that the data was Base64 encoded.

I then used the `base64` command with the decode option to decode the contents.

## Command

```bash
base64 -d data.txt