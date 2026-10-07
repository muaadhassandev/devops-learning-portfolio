# Bandit Level 5

## Objective

Find the password for the next level.

## Problem

The password is stored somewhere inside the `inhere` directory.

The challenge is that the correct file is human-readable, 1033 bytes in size, and is not executable.

## Approach

I searched through the files inside the `inhere` directory and used the `find` command to look for a file with the required size.

I then checked the file to make sure it contained human-readable text before reading its contents.

## Command

```bash
find . -type f -size 1033c
file ./<file-name>
cat ./<file-name>