#!/bin/env bash

#### Options ###
power_off="  Shutdown"
reboot="󰜉  Reboot"
lock_screen="  Lock Screen"
suspend="  Suspend"
hibernate="󰒲  Hibernate"
log_out="󰍃  Log Out"


# Options passed to fuzzel
options="$power_off\n$reboot\n$log_out\n$lock_screen"
lines="$(echo "$options" | grep -oF '\n' | wc -l)"
rofi_command="fuzzel -d -w 14 -l $((lines+1))"
chosen="$(echo -e "$options" | $rofi_command )"
case $chosen in
    "$lock_screen")
        hyprlock 
        ;;    
    "$power_off")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$log_out")
        if [[ "$DESKTOP_SESSION" == 'qtile' ]]; then
            loginctl terminate-session "${XDG_SESSION_ID-}"
        elif [[ "$DESKTOP_SESSION" == 'hyprland' ]]; then
            hyprctl dispatch exit
        fi        
esac
