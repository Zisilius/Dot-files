#!/bin/bash

setxkbmap -print | grep us > /dev/null

if [ $? == 0 ]
then
  setxkbmap -layout ru
else
  setxkbmap -layout us
fi

xmodmap $HOME/.Xmodmap
