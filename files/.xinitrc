#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

export _JAVA_AWT_WM_NONREPARENTING=1
export PULSE_LATENCY_MSEC=60

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

xsetroot -cursor_name left_ptr
#setxkbmap -layout us -variant colemak
xrandr --output DP-1 --primary
xrdb $HOME/.Xresources

xset r rate 250 30
pulseaudio --start
redshift &
xmodmap $HOME/.Xmodmap
xbindkeys
#sh $HOME/.fehbg
exec xmonad
