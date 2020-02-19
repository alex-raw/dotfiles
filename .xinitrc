#!/usr/bin/env sh

# eval eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
# export SSH_AUTH_SOCK
# export GPG_AGENT_INFO
xsetroot -cursor_name left_ptr
remaps &
desktop &
exec bspwm
