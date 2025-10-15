#!/usr/bin/env bash
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
root="$(cd "$here/.." && pwd)"
lockdir="$root/finale_locked"
outdir="$root/finale"
pwfile="$lockdir/password.txt"

# If invoked from inside finale_locked, correct lockdir
[ "$(basename "$here")" = "finale_locked" ] && lockdir="$here"

[[ -f "$pwfile" ]] || { echo "Place the password into $pwfile"; exit 1; }

if grep -qiE '^\s*our\s*$' "$pwfile"; then
  mkdir -p "$outdir"
  shopt -s dotglob nullglob
  for item in "$lockdir"/.*; do
    name="$(basename "$item")"
    [[ "$name" == "." || "$name" == ".." ]] && continue
    mv "$item" "$outdir/${name#.}"
  done
  for item in "$lockdir"/*; do
    [ -e "$item" ] || continue
    base="$(basename "$item")"
    mv "$item" "$outdir/$base"
  done
  rm -rf "$lockdir"
  echo "🔓 Finale unlocked!"
else
  echo "❌ Wrong password for finale."
  exit 2
fi
