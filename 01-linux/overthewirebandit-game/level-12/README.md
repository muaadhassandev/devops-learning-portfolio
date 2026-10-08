# Bandit Level 12

## Objective

Find the password for the next level.

## Problem

The password is stored in `data.txt`.

The file has been converted into a hexadecimal dump and then compressed multiple times using different compression and archive formats.

The challenge is to identify each file type and use the correct command to decompress or extract it.

## Approach

I first created a temporary working directory inside `/tmp` and copied `data.txt` into it.

I then used the `file` command to inspect the file and identified it as an ASCII text file containing a hexadecimal dump.

I used `xxd` to reverse the hexadecimal dump and create the original binary file.

From there, I repeatedly used the `file` command to identify the type of data I was dealing with.

Depending on the file type, I used the appropriate command to decompress or extract it.

The process involved working through multiple layers of:

- Gzip
- Bzip2
- Tar archives

I continued identifying and extracting each layer until the final file was identified as ASCII text.

## Commands

### Create a temporary working directory

```bash
mkdir /tmp/level12
cp ~/data.txt /tmp/level12/
cd /tmp/level12