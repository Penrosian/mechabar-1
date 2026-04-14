#!/usr/bin/env bash
#
# Launch a power menu
#
# Requirements:
# 	- fzf
#
# Author: Jesse Mirabel <sejjymvm@gmail.com>
# Created: August 19, 2025
# License: MIT

fcconf=()
# Get fzf color config
# shellcheck disable=SC1090,SC2154
. ~/.config/waybar/scripts/_fzf-colorizer.sh 2> /dev/null || true
# If the file is missing, fzf will fall back to its default colors

main() {
	local list=(
		'Shutdown'
		'Reboot'
		'Logout'
	)
	local opts=(
		'--border=sharp'
		'--border-label= Power Menu '
		'--height=~100%'
		'--highlight-line'
		'--no-input'
		'--pointer='
		'--reverse'
		"${fcconf[@]}"
	)

	local selected
	selected=$(printf '%s\n' "${list[@]}" | fzf "${opts[@]}")
	case $selected in
		'Shutdown') hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0';;
		'Reboot') hyprshutdown -t 'Restarting...' --post-cmd 'reboot' ;;
		'Logout') hyprshutdown ;;
		*) exit 1 ;;
	esac
}

main
