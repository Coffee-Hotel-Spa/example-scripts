#!/bin/sh

width=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .rect.width')
height=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .rect.height')
#echo "W: $width | H: $height"

higher=$(( height > width ))  #Boolean for the biggest (1 if height, 0 if width)
#echo $high

if [ $higher = 1 ]; then  #Splits
    swaymsg splitv #Vertivally if the focused windows height is greater than the width
else
    swaymsg splith  #And vice versa
fi

#termite &
$1 & ## Takes first argument as the program to be executed
exit
