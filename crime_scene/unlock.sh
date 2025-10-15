#!/usr/bin/env bash
set -e
here="$(cd "$(dirname "$0")" && pwd)"
root="$(cd "$here/.." && pwd)"
pwfile="$root/suspects_locked/password.txt"
lockdir="$root/suspects_locked"
outdir="$root/suspects"

if [ ! -f "$pwfile" ]; then
  echo "Place the password into suspects_locked/password.txt"; exit 1
fi

if grep -qiE '^\s*matcha\s*$' "$pwfile"; then
  mv "$lockdir" "$outdir"
  shopt -s dotglob nullglob
  for item in "$outdir"/.*; do
    name="$(basename "$item")"
    [ "$name" = "." ] || [ "$name" = ".." ] && continue
    mv "$item" "$outdir/${name#.}"
  done
  echo "🔓 Suspects unlocked!"
else
  echo "❌ Wrong password for suspects."
  exit 2
fi
