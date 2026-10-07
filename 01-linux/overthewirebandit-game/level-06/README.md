
### Level 6

```markdown
# Bandit Level 6

## Objective

Find the password for the next level.

## Problem

The password is stored somewhere on the server.

The correct file is owned by `bandit7`, belongs to the group `bandit6`, and is 33 bytes in size.

## Approach

I used the `find` command to search the filesystem using the ownership, group, and file-size requirements given by the challenge.

I also redirected error messages so that permission-denied messages did not clutter the terminal.

After finding the correct file, I read its contents.

## Command

```bash
find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null
cat <file-path>