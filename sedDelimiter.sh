#!/bin/bash
# Author: Isaac Schrader
# Description: Replace regex delimiter pattern with replacement text using sed.
# Usage:
#   echo "foo : bar" | ./sedDelimiter.sh '[[:space:]]:' ", "
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

if [ -z "$REPLACEMENT" ]; then
    REPLACEMENT=""
fi

# --- Processing & Output ---
sed -E "s/${PATTERN}/${REPLACEMENT}/g"
