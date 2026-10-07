# Bandit Level 11

## Objective

Find the password for the next level.

## Problem

The password is stored in `data.txt`.

The challenge is that the text has been encoded using ROT13, where each letter has been rotated by 13 positions.

## Approach

I first inspected the contents of `data.txt` and identified that the text had been transformed using ROT13.

I then used a command-line tool to decode the text and recover the original message.

## Command

```bash
tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt