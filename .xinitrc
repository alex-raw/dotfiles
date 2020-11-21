#!/usr/bin/env sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
xrdb-merge ~/.Xresources &
xsetroot -cursor_name left_ptr
remaps &
sh /home/alexraw/.screenlayout/full.sh &&
wallpapers

# touchpad &
unclutter &
picom &
redshift &
udiskie &
nm-applet &
dunst &
sxhkd &
# ultrawide &
# xautolock -time 10 -locker blurlock &
mailsync &
nextcloud &

# exec bspwm
exec spectrwm
