#!/bin/bash
# Author: Isaac Schrader
# Description: Filter stdin lines that match a literal name pattern using grep.
# Usage:
#   echo "Lizzy went home" | ./grepName.sh Lizzy
#
# Notes:
# - First argument: literal name pattern
# - Input: stdin
# - Output: matching lines only

# --- Input Handling ---
PATTERN="$1"

if [ -z "$PATTERN" ]; then
    echo "Error: name pattern required" >&2
    exit 1
fi

# --- Processing & Output ---
grep --fixed-strings "$PATTERN"
