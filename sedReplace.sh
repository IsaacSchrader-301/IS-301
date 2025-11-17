#!/bin/bash
# Author: Isaac Schrader
# Description: Replace all instances of a literal name pattern with replacement text using sed.
# Usage:
#   echo "Lizzy went home" | ./sedReplace.sh Lizzy Elizabeth
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

if [ -z "$REPLACEMENT" ]; then
    REPLACEMENT=""
fi

# --- Processing & Output ---
# Use "s///g" for global substitution
sed "s/${PATTERN}/${REPLACEMENT}/g"
