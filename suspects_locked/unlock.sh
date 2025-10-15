#!/usr/bin/env bash
root="$(cd "$(dirname "$0")/.." && pwd)"
if grep -q '6' "$root/evidence_locked/password.txt"; then
  mv "$root/evidence_locked" "$root/evidence"
  echo "🔓 Evidence unlocked!"
else
  echo "❌ Wrong password."
fi
