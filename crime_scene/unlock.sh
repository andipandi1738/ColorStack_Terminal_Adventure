#!/usr/bin/env bash
root="$(cd "$(dirname "$0")/.." && pwd)"
if grep -qi 'matcha' "$root/suspects_locked/password.txt"; then
  mv "$root/suspects_locked" "$root/suspects"
  echo "🔓 Suspects unlocked!"
else
  echo "❌ Wrong password."
fi
