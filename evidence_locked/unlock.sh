#!/usr/bin/env bash
set -e
here="$(cd "$(dirname "$0")" && pwd)"
pwfile="$here/password.txt"
if [ ! -f "$pwfile" ]; then echo "Place the password into evidence_locked/password.txt"; exit 1; fi
if grep -qE '^\s*6\s*$' "$pwfile"; then
  root="$(cd "$here/.." && pwd)"
  mv "$here" "$root/evidence"
  echo "🔓 Evidence unlocked!"
else
  echo "❌ Wrong password for evidence."
  exit 2
fi
