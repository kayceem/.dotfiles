#!/bin/env bash

sleep 2

MON="eDP-1"
RES="1920x1080"
FACTOR="0x0"
SCALE=1.2
REFRESH=$1

if [ -z "$REFRESH" ]; then
  echo "Usage: $0 <refresh_rate>"
  exit 1
fi

if [[ $REFRESH -eq "toggle" ]]; then
    curr=$(hyprctl monitors -j | jq -r '.[0].refreshRate')
    curr_int=$(printf "%.0f" "$curr")
    if [[ $curr_int -eq 300 ]]; then
        REFRESH=60
    else
        REFRESH=300
    fi
fi
for dir in /run/user/*; do
  for hypr_dir in "$dir/hypr/"*/; do
    socket="${hypr_dir}.socket.sock"
    if [[ -S $socket ]]; then 
      echo -e "keyword monitor $MON,$RES@$REFRESH,$FACTOR,$SCALE" | socat - UNIX-CONNECT:"$socket"
    fi
  done
done
