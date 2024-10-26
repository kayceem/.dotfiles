#!/usr/bin/env bash

# Check for flags
while getopts "pbs" flag; do
  case "$flag" in
    p)
      $(powerprofilesctl set performance)
      notify-send "Power State" "Mode changed to Performance"
      ;;
    b)
      $(powerprofilesctl set balanced)
      notify-send "Power State" "Mode changed to Balanced"
      ;;
    s)
      $(powerprofilesctl set power-saver)
      notify-send "Power State" "Mode changed to Power Saver"
      ;;
    *)
      echo "Usage: $0 -p (for Performance) or -b (for Balanced) or -s (for Power Saver)"
      exit 1
      ;;
  esac
done

# If no flag is provided, show usage
if [ $OPTIND -eq 1 ]; then
  echo "Usage: $0 -p (for Performance) or -b (for Balanced) or -s (for Power Saver)"
  exit 1
fi
