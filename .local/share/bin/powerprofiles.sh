#!/usr/bin/env bash

mode="$(asusctl profile -p | awk 'NR==2 {print $NF}')"

case "$mode" in
  Performance)
    display_mode="Performance"
    ;;
  Balanced)
    display_mode="Balanced"
    ;;
  Quiet)
    display_mode="Power Saver"
    ;;
  *)
    display_mode="Unknown"
    ;;
esac

echo "{\"text\":\"$display_mode\"}"
exit 0
