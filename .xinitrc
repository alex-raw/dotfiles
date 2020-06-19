#!/usr/bin/env sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
xsetroot -cursor_name left_ptr
remaps &
# desktop &

# # desktop &
# touchpad &
# unclutter &
# picom &
# redshift &
# nextcloud &
# udiskie &
# nm-applet &
# dunst &
# sxhkd &
# ultrawide &
# xautolock -time 10 -locker blurlock &
# xrdb-merge ~/.Xresources &
# mailsync &
# while true; do
# 	/usr/local/bin/dwm 2> /dev/null
# done

exec bspwm
