#!/usr/bin/env bash
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
pwfile="$here/password.txt"
root="$(cd "$here/.." && pwd)"
outdir="$root/finale"

if [ ! -f "$pwfile" ]; then
  echo "Place the password into finale_locked/password.txt"; exit 1
fi

if grep -qiE '^\s*our\s*$' "$pwfile"; then
  mkdir -p "$outdir"
  for item in "$here"/.[!.]* "$here"/..?*; do
    [ -e "$item" ] || continue
    base="$(basename "$item")"
    mv "$item" "$outdir/${base#.}"
  done
  for item in "$here"/*; do
    [ -e "$item" ] || continue
    base="$(basename "$item")"
    mv "$item" "$outdir/$base"
  done
  rm -rf "$here"
  echo "🔓 Finale unlocked!"
else
  echo "❌ Wrong password for finale."
  exit 2
fi
