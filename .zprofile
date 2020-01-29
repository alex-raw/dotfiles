export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export TERMINAL="alacritty"
export BROWSER="brave"
export READER="zathura"
export EDITOR="nvim"
export BIB="$HOME/Dropbox/latex/uni.bib"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

# cleanup
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export LESSHISTFILE="-"
#export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export TEXMFHOME="$HOME/.config/texmf"
export TEXMFVAR="$HOME/.config/texlive/texmf-var"
export TEXMFCONFIG="$HOME/.config/texlive/texmf-config"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

# Switch escape and caps if tty and no passwd required:
sudo -n loadkeys ~/.local/share/ttymaps.kmap 2>/dev/null
