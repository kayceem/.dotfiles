#!/usr/bin/env sh

wallpaperDirectory="/home/kayc/Misc/Wallpapers"

# choose random wallpaper from directory including subdirectories and set it as wallpaper

randomWallpaper=$(realpath "$(find "$wallpaperDirectory" -type f | shuf -n 1)")

swwwallpaper.sh -s "$randomWallpaper" &> /dev/null
notify-send "Auto Wallpaper" -i "$randomWallpaper" "Wallpaper changed"