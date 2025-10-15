#!/usr/bin/env bash
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
root="$(cd "$here/.." && pwd)"
lockdir="$root/evidence_locked"
outdir="$root/evidence"
pwfile="$lockdir/password.txt"

# If invoked from inside evidence_locked, correct lockdir
[ "$(basename "$here")" = "evidence_locked" ] && lockdir="$here"

[[ -f "$pwfile" ]] || { echo "Place the password into $pwfile"; exit 1; }

if grep -qE '^\s*6\s*$' "$pwfile"; then
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
  echo "🔓 Evidence unlocked!"
else
  echo "❌ Wrong password for evidence."
  exit 2
fi
