#!/bin/sh

IN="eDP-1"
EXT1="HDMI-1"
EXT2="DP-2"

DISPLAY_STATUS=$(xrandr)

if (echo $DISPLAY_STATUS | grep -E "$EXT1 disconnected.*$EXT2 disconnected"); then
    xrandr --output $IN --auto --output $EXT1 --off --output $EXT2 --off
elif (echo $DISPLAY_STATUS | grep -E "$EXT2 disconnected"); then
    xrandr --output $IN --pos 0x1152 --output $EXT1 --primary --pos 1366x840
else
    xrandr --output $IN --pos 0x1152 --output $EXT1 --primary --pos 1366x840 --output $EXT2 --pos 3286x0 --rotate left
fi

# Caps is control, left win is compose, ctrl-alt-bksp kills X
setxkbmap -option 'ctrl:nocaps,compose:lwin,terminate:ctrl_alt_bksp'
xrdb -merge .Xresources &
# Bind media keys
xbindkeys
# Hides cursor after 5 seconds
unclutter -idle 5 &
# Enable num lock
numlockx &
xmobar &
redshift &
exec ratpoison
