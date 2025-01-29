#!/usr/bin/env bash

# Check for flags
while getopts "psr" flag; do
  case "$flag" in
    p)
      $(sudo auto-cpufreq --force reset performance)
      notify-send "Power State" "Mode changed to Performance"
      ;;
    s)
      $(sudo auto-cpufreq --force powersave)
      notify-send "Power State" "Mode changed to Power Saver"
      ;;
    r)
      $(sudo auto-cpufreq --force reset)
      notify-send "Power State" "Mode Reset"
      ;;
    *)
      echo "Usage: $0 -p (for Performance) or -s (for Power Saver) or -r (for Reset)"
      exit 1
      ;;
  esac
done

# If no flag is provided, show usage
if [ $OPTIND -eq 1 ]; then
  echo "Usage: $0 -p (for Performance) or -s (for Power Saver) or -r (for Reset)"
  exit 1
fi
