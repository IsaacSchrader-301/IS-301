#!/bin/bash
# Author: Isaac Schrader
# Description: Replace all instances of a literal name pattern with replacement text using awk.
# Usage:
#   echo "Lizzy went home" | ./awkReplace.sh Lizzy Elizabeth
#
# Notes:
# - First argument: literal name pattern
# - Second argument: replacement text (optional)
# - Input: stdin
# - Output: all lines, transformed

PATTERN="$1"
REPLACEMENT="$2"

if [ -z "$PATTERN" ]; then
    echo "Error: name pattern required" >&2
    exit 1
fi

# If no replacement provided, default to empty string
if [ -z "$REPLACEMENT" ]; then
    REPLACEMENT=""
fi

# --- Processing & Output ---
awk -v pat="$PATTERN" -v rep="$REPLACEMENT" '{ gsub(pat, rep); print }'
