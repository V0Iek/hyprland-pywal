#!/bin/bash

if ! pgrep -x "hyprpaper" > /dev/null; then
  hyprpaper &
fi

wall_dir=$HOME/.Wallpapers
wallpapers=("$wall_dir"/*)

wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

hyprctl hyprpaper preload $wallpaper &
hyprctl hyprpaper wallpaper "eDP-1, $wallpaper"

wal -i $wallpaper

ln -sf $HOME/.cache/wal/colors-waybar.css $HOME/.config/waybar/colors-waybar.css
ln -sf $HOME/.cache/wal/colors-waybar.css $HOME/.config/wlogout/colors.css
ln -sf $HOME/.cache/wal/colors-rofi.rasi $HOME/.config/rofi/colors-rofi.rasi
ln -sf $HOME/.cache/wal/colors-swaync.css $HOME/.config/swaync/colors-swaync.css

swaync-client -R

killall swaync

swaync
