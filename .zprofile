export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"
export EDITOR="nvim"
export BIB="$HOME/Dropbox/latex/uni.bib"

export TEXMHOME="$HOME/.texmf"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
