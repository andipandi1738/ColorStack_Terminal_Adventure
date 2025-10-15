#!/usr/bin/env bash
set -e
here="$(cd "$(dirname "$0")" && pwd)"
pwfile="$here/password.txt"
if [ ! -f "$pwfile" ]; then echo "Place the password into finale_locked/password.txt"; exit 1; fi
if grep -qiE '^\s*our\s*$' "$pwfile"; then
  root="$(cd "$here/.." && pwd)"
  mv "$here" "$root/finale"
  echo "🔓 Finale unlocked!"
else
  echo "❌ Wrong password for finale."
  exit 2
fi
