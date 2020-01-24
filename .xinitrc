#!/usr/bin/env sh

remaps &
touchpad &
compton &
redshift &
desktop &
unclutter &
dropbox &
# xautolock -time 10 -locker blurlock &
xrdb -merge ~/.Xresources &
sxhkd

exec i3
