#!/bin/bash
# Author: Isaac Schrader
# Description: Unified script to process stdin text using grep, awk, or sed modes with regex delimiter patterns.
# Usage:
#   echo "foo : bar" | ./delimiterTool.sh --grep '[[:space:]]:'
#   echo "foo : bar" | ./delimiterTool.sh --awk '[[:space:]]:' ", "
#   echo "foo : bar" | ./delimiterTool.sh --sed '[[:space:]]:' ", "
#
# Notes:
# - Mode flag required: --grep, --awk, or --sed
# - First argument after mode: regex delimiter pattern (non-literal)
# - Second argument (optional): replacement text (for awk/sed)
# - Input: stdin
# - Output: stdout (processable format)

MODE="$1"
PATTERN="$2"
REPLACEMENT="$3"

if [ -z "$MODE" ] || [ -z "$PATTERN" ]; then
    echo "Error: usage requires mode (--grep|--awk|--sed) and regex delimiter pattern" >&2
    exit 1
fi

case "$MODE" in
    --grep)
        grep -E "$PATTERN"
        ;;
    --awk)
        awk -v pat="$PATTERN" -v rep="$REPLACEMENT" '{
            gsub(pat, rep)
            print
        }'
        ;;
    --sed)
        sed -E "s/${PATTERN}/${REPLACEMENT}/g"
        ;;
    *)
        echo "Error: invalid mode. Use --grep, --awk, or --sed." >&2
        exit 1
        ;;
esac
