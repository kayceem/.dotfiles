#!/usr/bin/env bash

mode="$(powerprofilesctl get)"

case "$mode" in
  performance)
    display_mode="Performance"
    ;;
  balanced)
    display_mode="Balanced"
    ;;
  power-saver)
    display_mode="Power Saver"
    ;;
  *)
    display_mode="Unknown"
    ;;
esac

echo "{\"text\":\"$display_mode\"}"
exit 0
