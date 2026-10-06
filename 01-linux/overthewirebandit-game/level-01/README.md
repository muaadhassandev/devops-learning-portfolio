# Bandit Level 1

## Objective

Find the password for the next level.

## Problem

The password is stored in a file named `-` in the home directory.

The challenge is that `-` can be interpreted by Linux commands as an option rather than a filename.

## Approach

I first listed the contents of the directory and identified the file named `-`.

To explicitly tell the shell that `-` is a file in the current directory, I used `./` before the filename.

## Command

cat ./-


## What I Learned

Linux commands can interpret filenames beginning with `-` as command-line options.

Using `./` makes the path explicit and allows the file to be accessed normally.

This was a useful introduction to handling unusual filenames from the Linux command line.
