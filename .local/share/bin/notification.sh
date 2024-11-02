#!/usr/bin/env sh

# Set variables
scrDir=$(dirname "$(realpath "$0")")
source "$scrDir/globalcontrol.sh"
roconf="${confDir}/rofi/notification.rasi"

# Set rofi scaling
[[ "${rofiScale}" =~ ^[0-9]+$ ]] || rofiScale=10
r_scale="configuration {font: \"JetBrainsMono Nerd Font ${rofiScale}\";}"
wind_border=$((hypr_border))
elem_border=$([ $hypr_border -eq 0 ] && echo "5" || echo $hypr_border)
border_width=$((hypr_width * 2/3))
# Evaluate spawn position
readarray -t curPos < <(hyprctl cursorpos -j | jq -r '.x,.y')
readarray -t monRes < <(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width,.height,.scale,.x,.y')
readarray -t offRes < <(hyprctl -j monitors | jq -r '.[] | select(.focused==true).reserved | map(tostring) | join("\n")')
monRes[2]="$(echo "${monRes[2]}" | sed "s/\.//")"
monRes[0]="$(( ${monRes[0]} * 100 / ${monRes[2]} ))"
monRes[1]="$(( ${monRes[1]} * 100 / ${monRes[2]} ))"
curPos[0]="$(( ${curPos[0]} - ${monRes[3]} ))"
curPos[1]="$(( ${curPos[1]} - ${monRes[4]} ))"

x_pos="east"
x_off="$((${offRes[0]} - 230))"
y_pos="north"
y_off="$((${offRes[1]} - 30 ))"

r_override="window{location:${x_pos} ${y_pos};anchor:${x_pos} ${y_pos};x-offset:${x_off}px;y-offset:${y_off}px;border:${border_width}px;border-radius:${wind_border}px;} wallbox{border-radius:${elem_border}px;} element{border-radius:${elem_border}px;}"

notifications.py rofi | rofi -dmenu -theme-str "${r_scale}" -theme-str "${r_override}" -config "${roconf}"