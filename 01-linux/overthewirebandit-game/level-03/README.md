# Bandit Level 3

## Objective

Find the password for the next level.

## Problem

The password is stored in a hidden file inside the `inhere` directory.

The challenge is that hidden files are not shown when using the normal `ls` command.

## Approach

I first checked my current directory and entered the `inhere` directory.

I used `ls` to list the contents, but the file was not visible.

I then used `ls -la` to display hidden files and identified the hidden file containing the password.

## Command

```bash
ls -la
cat "...Hiding-From-You"