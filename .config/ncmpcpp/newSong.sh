#!/usr/bin/env bash

albumdir="/home/jacob/Music/$(dirname "$(mpc current -f '%file%')")/"
artpath="$albumdir$(ls "$albumdir" | awk "/(cover|[fF]older)\.jpg/{print $1}")"

if [[ -f "$artpath" ]]; then
    convert -resize 128x128 "$artpath" /tmp/cover.png

    notify-send "$(mpc --format '%title%' current)" "$(mpc --format '%artist% - %album%' current)" -i "/tmp/cover.png"
else
    notify-send "$(mpc --format '%title%' current)" "$(mpc --format '%artist% - %album%' current)"
fi
