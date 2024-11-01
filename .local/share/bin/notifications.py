#!/usr/bin/python3

import subprocess
import json
import sys

def get_dunst_history():
    result = subprocess.run(['dunstctl', 'history'], stdout=subprocess.PIPE)
    history = json.loads(result.stdout.decode('utf-8'))
    return history

def format_history(history):
    count = len(history['data'][0])
    alt = 'none'
    tooltip_click = []
    tooltip_click.append("󰎟 Notifications")
    tooltip_click.append("󰳽 scroll-down:  history pop")
    tooltip_click.append("󰳽 click-left:  Enable & Disable DND")
    tooltip_click.append("󰳽 click-middle: 󰛌 clear history")
    tooltip_click.append("󰳽 click-right: 󱄊 close all")

    if count > 0:
        alt = 'notification'

    isDND = subprocess.run(['dunstctl', 'get-pause-level'], stdout=subprocess.PIPE)
    isDND = isDND.stdout.decode('utf-8').strip()
    if isDND != '0':
        alt = "dnd"
    formatted_history = {
        "text": str(count),
        "alt": alt,
        "class": "custom-notifications"
    }
    return formatted_history

def format_history_rofi(history):
    count = len(history['data'][0])
    formatted_history = []
    if count > 0:
        notifications = history['data'][0][:10]  # Get the first 10 notifications
        for notification in notifications:
            body = notification.get('body', {}).get('data', '')
            category = notification.get('category', {}).get('data', '')
            if category:
                formatted_history.append(f" {body} ({category})")
            else:
                formatted_history.append(f" {body}")

    return '\n'.join(formatted_history)

def main():
    if len(sys.argv) == 2:
        command = sys.argv[1]
        if command == "rofi":
            history = get_dunst_history()
            formatted_history = format_history_rofi(history)
            sys.stdout.write(formatted_history)
    else:
        history = get_dunst_history()
        formatted_history = format_history(history)
        sys.stdout.write(json.dumps(formatted_history) + '\n')

    sys.stdout.flush()

if __name__ == "__main__":
    main()
