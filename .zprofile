export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export TERMINAL="alacritty"
export BROWSER="brave"
export READER="zathura"
export EDITOR="nvim"
export BIB="$HOME/Dropbox/latex/uni.bib"

export TEXMFHOME="$HOME/.config/texmf"
export TEXMFVAR="$HOME/.config/texlive/texmf-var"
export TEXMFCONFIG="$HOME/.config/texlive/texmf-config"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
