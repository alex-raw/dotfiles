#!/usr/bin/env sh

remaps &
touchpad &
# picom &
# redshift &
unclutter &
# dropbox &
# xautolock -time 10 -locker blurlock &
xrdb -merge ~/.Xresources &
# sxhkd

desktop &
exec i3
