#!/bin/zsh

# FILEPATH: script.sh

# Define the directory containing the scripts
scripts_dir="/home/kweikamp/.screenlayout"

# Get the list of scripts in the directory
scripts=("$scripts_dir"/*.sh)

# Prompt the user to select a script using Rofi
selected_scripts=$(rofi -dmenu -multi-select -p "Select Workspace:" \
	-format i -mesg "Use 'Tab' to select multiple scripts, then press 'Enter' to run them." \
	<<< "$(for script in "${scripts[@]}"; do echo "$script"; done)")

# kill all running polybar instances
killall -q polybar

# Run the selected scripts
for script_index in $selected_scripts; do
	echo "Starting Workspace: ${scripts[$script_index+1]}"
	script="${scripts[$script_index+1]}"
	$script
done

# set wallpaper on all connected screens
feh --bg-fill --randomize /home/kweikamp/Bilder/Wallpapers/*
