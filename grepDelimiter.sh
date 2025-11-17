#!/bin/bash
# Author: Isaac Schrader
# Description: Filter stdin lines that match a regex delimiter pattern using grep.
# Usage:
#   echo "foo : bar" | ./grepDelimiter.sh '[[:space:]]:'
#
# Notes:
# - First argument: regex delimiter pattern (non-literal)
# - Input: stdin
# - Output: matching lines only

PATTERN="$1"

if [ -z "$PATTERN" ]; then
    echo "Error: regex delimiter pattern required" >&2
    exit 1
fi

# --- Processing & Output ---
grep -E "$PATTERN"
