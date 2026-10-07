# Bandit Level 2

## Objective

Find the password for the next level.

## Problem

The password is stored in a file named `--spaces in this filename--` in the home directory.

The challenge is that the filename contains spaces and begins with `--`.

## Approach

I first listed the contents of the directory and identified the file containing spaces.

Because the filename contains spaces, I used quotes to treat the entire filename as a single argument.

I also used `./` to explicitly specify that the file was located in the current directory.

## Command

cat "./--spaces in this filename--"