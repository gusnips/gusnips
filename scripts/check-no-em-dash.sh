#!/bin/sh
set -eu
# Check both the character and HTML entities that render it on GitHub.
pattern="$(printf '\342\200\224')|&mdash;|&#(0*8212|[xX]0*2014);"
status=0
matches=$(grep -nE "$pattern" README*.md) || status=$?
if [ "$status" -eq 0 ]; then
    printf '%s\n' "$matches" >&2
    printf '%s\n' "Em dash found. Use a period, comma, colon or parentheses." >&2
    exit 1
fi
if [ "$status" -ne 1 ]; then
    exit "$status"
fi
printf '%s\n' "No em dash in README files."
