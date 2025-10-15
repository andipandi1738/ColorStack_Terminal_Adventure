#!/usr/bin/env bash
set -e
root="$(cd "$(dirname "$0")" && pwd)"

# Relock finale
if [ -d "$root/finale" ]; then
  mv "$root/finale/reveal.sh" "$root/finale/.reveal.sh" 2>/dev/null || true
  mv "$root/finale" "$root/finale_locked"
  echo "# Put the final password here, then run finale_locked/unlock.sh" > "$root/finale_locked/password.txt"
fi

# Relock evidence
if [ -d "$root/evidence" ]; then
  for f in matcha_cup.txt discord_logs.txt fingerprints.txt leavey_camera_log.txt; do
    if [ -f "$root/evidence/$f" ]; then mv "$root/evidence/$f" "$root/evidence/.$f"; fi
  done
  mv "$root/evidence" "$root/evidence_locked"
  echo "# Put the second password here, then run evidence_locked/unlock.sh" > "$root/evidence_locked/password.txt"
fi

# Relock suspects
if [ -d "$root/suspects" ]; then
  for d in ana andi hector jose khalil; do
    if [ -d "$root/suspects/$d" ]; then mv "$root/suspects/$d" "$root/suspects/.$d"; fi
  done
  mv "$root/suspects" "$root/suspects_locked"
  echo "# Put the first password here, then run ../crime_scene/unlock.sh" > "$root/suspects_locked/password.txt"
fi

echo "🔒 Reset complete. Everything relocked."
