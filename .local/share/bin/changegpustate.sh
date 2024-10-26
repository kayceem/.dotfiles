#!/usr/bin/env bash

# Check for flags
while getopts "ih" flag; do
  case "$flag" in
    i)
      output=$(supergfxctl -m Integrated)
      notify-send "GPU State" "$output"
      ;;
    h)
      output=$(supergfxctl -m Hybrid)
      notify-send "GPU State" "$output"
      ;;
    *)
      echo "Usage: $0 -i (for Integrated) or -h (for Hybrid)"
      exit 1
      ;;
  esac
done

# If no flag is provided, show usage
if [ $OPTIND -eq 1 ]; then
  echo "Usage: $0 -i (for Integrated) or -h (for Hybrid)"
  exit 1
fi
