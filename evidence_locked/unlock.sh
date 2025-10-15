#!/usr/bin/env bash
root="$(cd "$(dirname "$0")/.." && pwd)"
if grep -qi 'our' "$root/finale_locked/password.txt"; then
  echo "🔓 Finale unlocked!"
else
  echo "❌ Wrong password."
fi
