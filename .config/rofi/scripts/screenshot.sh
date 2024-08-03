#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi"
rofi_command="rofi -theme $dir/colors-rofi.rasi"

# Options
screen="󰍹  Screen"
window="󱂬  Window"
area="󰒉  Area"

# Variable passed to rofi
options="$screen\n$window\n$area"

chosen="$(echo -e "$options" | $rofi_command -p '' -dmenu -selected-row 1)"
case $chosen in
    $screen)
  	sleep 0.4; grim -t png - | wl-copy -t image/png
        ;;
    $area)
		grim -g "$(slurp)" -t png - | wl-copy -t image/png
        ;;
    $window)
		sleep 0.4; grim -g "$(hyprctl activewindow | grep at: | cut -d' ' -f2) $(hyprctl activewindow | grep size: | cut -d' ' -f2 | sed 's/,/x/g')" - | wl-copy
        ;;
esac
