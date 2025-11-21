#!/bin/bash
# Author: Isaac Schrader
# Purpose: Transform messy soil data into line-oriented CSV with header + unique ID
# Usage: ./process_soils_with_id.sh > soils.csv
# Input: OregonWineCountrySoils.txt
# Output: CSV lines to stdout (comma-separated values), with header row and ID column

input_file="OregonWineCountrySoils.txt"

if [ ! -f "$input_file" ]; then
    echo "Error: $input_file not found" >&2
    exit 1
fi

# Print header row first
echo "ID,Region,Soil,Type"

# Collapse messy whitespace into commas → CSV
# Then prepend a unique ID (line number) to each record
sed 's/[[:space:]]\+/,/g; s/^,*//; s/,*$//' "$input_file" | nl -w1 -s"," 


