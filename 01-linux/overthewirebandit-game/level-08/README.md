
### Level 8

```markdown
# Bandit Level 8

## Objective

Find the password for the next level.

## Problem

The password is stored in `data.txt`.

The correct password is the only line that occurs exactly once.

## Approach

I used `sort` to arrange the lines in the file and then used `uniq -u` to identify the line that appeared only once.

## Command

```bash
sort data.txt | uniq -u