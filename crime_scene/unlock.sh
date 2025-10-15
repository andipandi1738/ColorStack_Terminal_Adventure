#!/usr/bin/env bash
set -e
root="$(cd "$(dirname "$0")/.." && pwd)"
pwfile="$root/suspects_locked/password.txt"
if [ ! -f "$pwfile" ]; then echo "Place the password into suspects_locked/password.txt"; exit 1; fi
if grep -qiE '^\s*matcha\s*$' "$pwfile"; then
  mv "$root/suspects_locked" "$root/suspects"
  echo "🔓 Suspects unlocked!"
else
  echo "❌ Wrong password for suspects."
  exit 2
fi
