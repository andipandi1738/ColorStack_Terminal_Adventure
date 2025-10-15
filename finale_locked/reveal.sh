#!/usr/bin/env bash
culprit_file="$(dirname "$0")/culprit.txt"
if [ ! -f "$culprit_file" ]; then echo "Create culprit.txt with a name."; exit 1; fi
culprit="$(cat "$culprit_file" | tr -d '\r\n')"
if [ "$culprit" = "Hector" ]; then
  echo "☕ Hector brought the kittens and double-brewed the matcha."
  echo "Technically, the kittens were the claws—but Hector was the cause."
elif [ "$culprit" = "kittens" ]; then
  echo "🐾 Close... but not quite. They were chaos—Hector was the cause."
else
  echo "❌ Wrong suspect."
fi
