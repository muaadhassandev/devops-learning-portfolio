
### Level 12

```markdown
# Bandit Level 12

## Objective

Find the password for the next level.

## Problem

The password is stored in `data.txt`, which is a hexdump of a file that has been compressed multiple times using different compression formats.

## Approach

I first converted the hexdump back into its original binary form.

I then used the `file` command to identify the compression format at each stage.

I repeatedly decompressed or extracted the file and checked its type again until I reached the password.

## Command

```bash
xxd -r data.txt data
file data