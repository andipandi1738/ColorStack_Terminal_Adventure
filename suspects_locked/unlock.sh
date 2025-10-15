#!/usr/bin/env bash
set -euo pipefail

# Determine paths whether called from crime_scene or suspects_locked
if [ -d "$(dirname "$0")/.." ]; then
  # default for being inside suspects_locked or crime_scene
  here="$(cd "$(dirname "$0")" && pwd)"
else
  here="$PWD"
fi

# If we're inside suspects_locked, lockdir is here; if inside crime_scene, lockdir is ../suspects_locked
case "$(basename "$here")" in
  suspects_locked) lockdir="$here" ; root="$(cd "$here/.." && pwd)" ;;
  crime_scene)     root="$(cd "$here/.." && pwd)" ; lockdir="$root/suspects_locked" ;;
  *)               # Fallback: assume we're in crime_scene by path
                   root="$(cd "$here/.." && pwd)" ; lockdir="$root/suspects_locked" ;;
esac

outdir="$root/suspects"
pwfile="$lockdir/password.txt"

[[ -f "$pwfile" ]] || { echo "Place the password into $pwfile"; exit 1; }

if grep -qiE '^\s*matcha\s*$' "$pwfile"; then
  mkdir -p "$outdir"
  shopt -s dotglob nullglob
  # Move hidden items (including hidden dirs) out and unhide them
  for item in "$lockdir"/.*; do
    name="$(basename "$item")"
    [[ "$name" == "." || "$name" == ".." ]] && continue
    mv "$item" "$outdir/${name#.}"
  done
  # Move any non-hidden leftovers (just in case)
  for item in "$lockdir"/*; do
    [ -e "$item" ] || continue
    base="$(basename "$item")"
    mv "$item" "$outdir/$base"
  done
  rm -rf "$lockdir"
  echo "🔓 Suspects unlocked!"
else
  echo "❌ Wrong password for suspects."
  exit 2
fi
