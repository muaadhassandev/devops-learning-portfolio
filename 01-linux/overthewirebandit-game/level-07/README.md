
### Level 7

```markdown
# Bandit Level 7

## Objective

Find the password for the next level.

## Problem

The password is stored in the file `data.txt` next to the word `millionth`.

The challenge is to find the specific line containing the required word.

## Approach

I searched the contents of `data.txt` for the word `millionth`.

Instead of manually looking through the entire file, I used `grep` to find the matching line.

## Command

```bash
grep millionth data.txt