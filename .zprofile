export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export TERMINAL="alacritty"
export BROWSER="brave"
export READER="zathura"
export EDITOR="nvim"
export BIB="$HOME/Nextcloud/latex/uni.bib"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

export R_HISTFILE=~/.RHistory

# cleanup
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export LESSHISTFILE="-"
#export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export TEXMFHOME="$HOME/.config/texmf"
export TEXMFVAR="$HOME/.config/texlive/texmf-var"
export TEXMFCONFIG="$HOME/.config/texlive/texmf-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

# Switch escape and caps if tty and no passwd required:
sudo -n loadkeys ~/.local/share/ttymaps.kmap 2>/dev/null
