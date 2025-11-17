#!/bin/bash
# Author: Isaac Schrader
# Description: Unified script to process stdin text using grep, awk, or sed modes.
# Usage:
#   echo "Lizzy went home" | ./nameTool.sh --grep Lizzy
#   echo "Lizzy went home" | ./nameTool.sh --awk Lizzy Elizabeth
#   echo "Lizzy went home" | ./nameTool.sh --sed Lizzy Elizabeth
#
# Notes:
# - Mode flag required: --grep, --awk, or --sed
# - First argument after mode: literal name pattern
# - Second argument (optional): replacement text (for awk/sed)
# - Input: stdin
# - Output: stdout (processable format)

# --- Input Validation ---
MODE="$1"
PATTERN="$2"
REPLACEMENT="$3"

if [ -z "$MODE" ] || [ -z "$PATTERN" ]; then
    echo "Error: usage requires mode (--grep|--awk|--sed) and name pattern" >&2
    exit 1
fi

# --- Mode Dispatch ---
case "$MODE" in
    --grep)
        # Output only lines matching the pattern
        grep --fixed-strings "$PATTERN"
        ;;
    --awk)
        # Replace pattern with replacement (default empty string)
        awk -v pat="$PATTERN" -v rep="$REPLACEMENT" '{ gsub(pat, rep); print }'
        ;;
    --sed)
        # Replace pattern with replacement (default empty string)
        sed "s/${PATTERN}/${REPLACEMENT}/g"
        ;;
    *)
        echo "Error: invalid mode. Use --grep, --awk, or --sed." >&2
        exit 1
        ;;
esac
