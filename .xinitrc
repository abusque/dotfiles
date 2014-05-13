#!/bin/sh

# Sets the 1440p monitor as primary display
xrandr --output DVI-I-2 --primary
# Caps is control, right win is compose, ctrl-alt-bksp kills X
setxkbmap -option 'ctrl:nocaps,compose:rwin,terminate:ctrl_alt_bksp'
xrdb -merge .Xresources &
# Hides cursor after 5 seconds
unclutter -idle 5 &
# Enable num lock
numlockx &
xmobar &
redshift &
exec ratpoison
