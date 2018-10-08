#!/usr/bin/env bash

# No empty note
if [[ -z "$1" ]]; then
  echo "Lame script to add the files for a new note."
  echo " Usage: ${0##*/} <new_note_name>"
  echo "   eg.: ${0##*/} git"
  exit 10
fi

# New note only please
if [[ -d "$1" ]]; then
  echo "[ERROR] Note '$1' is already there! Are you copying yourself or getting too old?" >&2
  echo "[ERROR] How about learning something new today?" >&2
  exit 20
fi

# Create the directory & add the README.md
mkdir "$1" && cat <<EOREADME >"${1}/README.md"
# Note - $1

Note(s) on $1

  - [Note One](#1-note-one)
  - [Note Two](#1-note-two)
  - [References](#N-references)

## 1. Note One

Bla bla bla...

## 2. Note Two

Bla bla bla...

## N. References

  - [Reference1](https://link1)
  - [Reference2](https://link2)
EOREADME
note_added_ok=$?

# Add note reference in parent README
if [[ $note_added_ok == 0 ]]; then
  sed -i "s#^\[//\]: \#.*#  - [$1]($1)#g" README.md
  note_added_ok=$((note_added_ok + $?))
fi

exit $note_added_ok
