#!/usr/bin/env sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

xsetroot -cursor_name left_ptr
remaps &
desktop &
exec bspwm
