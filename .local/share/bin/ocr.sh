#!/usr/bin/env sh

# Restores the shader after screenshot has been taken
restore_shader() {
	if [ -n "$shader" ]; then
		hyprshade on "$shader"
	fi
}

# Saves the current shader and turns it off
save_shader() {
	shader=$(hyprshade current)
	hyprshade off
	trap restore_shader EXIT
}
temp_screenshot="/tmp/screenshot.png"

save_shader

grimblast --freeze save area "$temp_screenshot" && (tesseract "$temp_screenshot" stdout | wl-copy) && restore_shader
rm "$temp_screenshot"

notify-send -a "OCR" $'Copied:\n'"$(wl-paste)"