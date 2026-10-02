#!/bin/sh
# No em dash in the READMEs people read. An em dash gives away AI-written text.
# Use a period, comma, colon or parentheses.
if grep -n "$(printf '\342\200\224')" README*.md; then
    echo "Em dash found. Use a period, comma, colon or parentheses." >&2
    exit 1
fi
echo "no em dash in README files"
