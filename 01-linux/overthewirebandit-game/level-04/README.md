# Bandit Level 4

## Objective

Find the password for the next level.

## Problem

The password is stored in the only human-readable file inside the `inhere` directory.

The challenge is that there are several files, and I needed to identify which one contained readable text.

## Approach

I first entered the `inhere` directory and listed the files.

I then used the `file` command to check the type of each file and identify the one containing human-readable text.

After finding the correct file, I used `cat` to read its contents.

## Command

```bash
file ./*
cat ./<file-name>