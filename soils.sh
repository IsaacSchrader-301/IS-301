#!/usr/bin/env bash
set -euo pipefail
echo "Oregon Wine Country Soils — report"
if [[ -f /winecountrysoils/soils.csv ]]; then
  echo "Preview of soils.csv:"
  head -n 5 /winecountrysoils/soils.csv
else
  echo "soils.csv found."
fi

