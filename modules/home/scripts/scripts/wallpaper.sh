#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
#I dont know what the fuck I am doing
menu() {
    find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
}
main() {
    choice=$(menu | wofi -c ~/.config/wofi/wallpaper -s ~/.config/wofi/style-wallpaper.css --show dmenu --prompt "Select Wallpaper:" -n)
    selected_wallpaper=$(echo "$choice" | sed 's/^img://')
    swww img "$selected_wallpaper" --transition-type any --transition-fps 60 --transition-duration .5
    cp -r $selected_wallpaper "$HOME/Pictures/nixos.png"
    cp -r $selected_wallpaper "$HOME/nixos-config/nixos.png"
    notify-send -t 10000 "Generating Theme..."
    sudo $HOME/nixos-config/modules/home/scripts/scripts/nixtest.sh $USER
    swaync-client --reload-css
    hyprctl reload
    notify-send -t 10000 "Theme set"
}
main
