#!/usr/bin/env bash
# Lame script to remove BOM from a txt file

export LC_ALL=C

if [[ -z "$1" ]]; then
  echo "Script to remove BOM characters from a TXT file"
  echo " Usage: ${0##*/} <file_with_BOM>"
  echo "   eg.: ${0##*/} index.html"
  exit 10
fi

sed -i '1s/^\xEF\xBB\xBF//' "$1"

exit $?
