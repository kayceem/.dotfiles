#!/bin/env sh


format_history() {
    result=$(dunstctl history)
    count=$(echo "$result" | jq '.' | jq '.data[0] | length')
    tooltip="$count notifications"

    alt='none'
    if [[ $count -gt 0 ]]; then
        alt='notification'
    fi

    isDND=$(dunstctl get-pause-level | tr -d '\n')

    if [[ "$isDND" -ne '0' ]]; then
        alt="dnd"
    fi
    class="custom-notifications"

    # formatted_history=$(jq -n \
 #       --arg alt "$alt" \
 #       --arg tooltip "$tooltip" \
 #       --arg class "custom-notifications" \
 #       '{alt: $alt, tooltip: $tooltip , class: $class}')

#    formatted_history="{alt: $alt, tooltip: $tooltip , class: $class}"
    formatted_history="{\"alt\": \"$alt\", \"tooltip\": \"$tooltip\" , \"class\": \"$class\"}"
    echo "$formatted_history"
}

formatted_history=$(format_history)
echo "$formatted_history"
