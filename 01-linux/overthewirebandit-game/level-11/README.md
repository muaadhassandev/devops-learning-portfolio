# Bandit Level 11

## Objective

Find the password for the next level.

## Problem

The password is stored in `data.txt`.

The contents of the file have been encoded using ROT13, which replaces each letter with another letter.

## Approach

I first viewed the contents of `data.txt` and identified that the text was encoded using ROT13.

I used the ROT13 feature in CyberChef to decode the text.

I then copied the encoded text from the terminal into CyberChef, selected the ROT13 operation, and used the decoded output to obtain the password.

## Command

cat data.txt

## What I Learned

I learned how ROT13 encoding works and how CyberChef can be used to decode encoded text.

This level also showed me how useful tools like CyberChef can be when working with encoded data.