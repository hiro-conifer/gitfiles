#!/bin/sh
swayidle -w timeout 60 'hyprlock' \
            timeout 70 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' \
            before-sleep 'hyprlock' &
