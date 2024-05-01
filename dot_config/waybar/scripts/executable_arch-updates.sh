#!/bin/bash

function CheckUpdates() {
  arch="$(checkupdates | wc -l)"
  aur="$(yay -Qua | wc -l)"
  number=$((arch+aur))
  if [ "$number" -gt 0 ]; then
    text="  $number"
  else
    text=""
  fi

  echo "$text"
}

function RefreshUpdates() {
  value="$(CheckUpdates)"
  eww update arch-updates="$value"
}

function Update() {
	kitty 'yay'
	RefreshUpdates
}

case "$1" in
        Refresh)
            RefreshUpdates
	    exit 0
            ;;
	Update)
            Update
	    exit 0
	    ;;
        *)
            CheckUpdates
            exit 0 
esac
