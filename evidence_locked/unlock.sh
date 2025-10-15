#!/usr/bin/env bash
set -e
here="$(cd "$(dirname "$0")" && pwd)"
pwfile="$here/password.txt"
root="$(cd "$here/.." && pwd)"
outdir="$root/evidence"

if [ ! -f "$pwfile" ]; then
  echo "Place the password into evidence_locked/password.txt"; exit 1
fi

if grep -qE '^\s*6\s*$' "$pwfile"; then
  mv "$here" "$outdir"
  shopt -s dotglob nullglob
  for item in "$outdir"/.*; do
    name="$(basename "$item")"
    [ "$name" = "." ] || [ "$name" = ".." ] && continue
    mv "$item" "$outdir/${name#.}"
  done
  echo "🔓 Evidence unlocked!"
else
  echo "❌ Wrong password for evidence."
  exit 2
fi
