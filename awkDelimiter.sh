#!/bin/bash
# Author: Isaac Schrader
# Description: Replace regex delimiter pattern with replacement text using awk.
# Usage:
#   echo "foo : bar" | ./awkDelimiter.sh '[[:space:]]:' ", "
#
# Notes:
# - First argument: regex delimiter pattern (non-literal)
# - Second argument: replacement text (optional)
# - Input: stdin
# - Output: all lines, transformed

PATTERN="$1"
REPLACEMENT="$2"

if [ -z "$PATTERN" ]; then
    echo "Error: regex delimiter pattern required" >&2
    exit 1
fi

# Default replacement is empty string
if [ -z "$REPLACEMENT" ]; then
    REPLACEMENT=""
fi

# --- Processing & Output ---
awk -v pat="$PATTERN" -v rep="$REPLACEMENT" '{
    gsub(pat, rep)
    print
}'
