#!/usr/bin/env bash
# Organize files in a given folder into folders based on file extension.
# Test with a disposable folder first.
set -euo pipefail
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 FOLDER"
  exit 1
fi
TARGET="$1"
if [ ! -d "$TARGET" ]; then
  echo "Error: folder not found: $TARGET"
  exit 1
fi
shopt -s nullglob
for FILE in "$TARGET"/*; do
  [ -f "$FILE" ] || continue
  BASE="$(basename "$FILE")"
  EXT="${BASE##*.}"
  if [ "$BASE" = "$EXT" ]; then EXT="no_extension"; else EXT="${EXT,,}"; fi
  mkdir -p "$TARGET/$EXT"
  mv -- "$FILE" "$TARGET/$EXT/"
done
echo "Organizing complete: $TARGET"
