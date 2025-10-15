#!/usr/bin/env bash
set -e
culprit_file="$(cd "$(dirname "$0")" && pwd)/culprit.txt"
if [ ! -f "$culprit_file" ]; then echo "Create culprit.txt with a name."; exit 1; fi
culprit="$(tr -d '\r\n' < "$culprit_file")"
case "$culprit" in
  Hector)
    echo "☕ Hector brought the kittens and double-brewed the matcha."
    echo "Technically, the kittens were the claws—but Hector was the cause."
    ;;
  kittens|Kittens)
    echo "🐾 Close... but not quite. They were chaos—Hector was the cause."
    ;;
  *)
    echo "❌ Wrong suspect."
    ;;
esac
